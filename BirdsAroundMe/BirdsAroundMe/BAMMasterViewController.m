//
//  BAMMasterViewController.m
//  BirdsAroundMe
//
//  Created by Michael Eilers Smith on 2014-07-23.
//  Copyright (c) 2014 sobremesa. All rights reserved.
//

#import "BAMMasterViewController.h"

#import "BAMDetailViewController.h"
#import "BAMRemoteSighting.h"
#import "BAMSightingSynchronizer.h"
#import "BAMPersistentStackManager.h"
#import "BAMPersistentStack.h"
#import "BAMEbirdWebservice.h"
#import "BAMSightingSynchronizer.h"
#import "TableViewDataSource.h"

@interface BAMMasterViewController ()

@property (strong, nonatomic) TableViewDataSource *tableViewDataSource;

@property (nonatomic, strong) BAMEbirdWebservice *webservice;
@property (nonatomic, strong) BAMPersistentStack *persistentStack;
@property (nonatomic, strong) BAMSightingSynchronizer *synchronizer;

@end

@implementation BAMMasterViewController

- (void)awakeFromNib
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
        self.preferredContentSize = CGSizeMake(320.0, 600.0);
    }
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"BAMRemoteSighting" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    [fetchRequest setFetchBatchSize:20];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"sciName" ascending:NO];
    NSArray *sortDescriptors = @[sortDescriptor];
    
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    
    void (^configureCell)(UITableViewCell*, BAMRemoteSighting*) = ^(UITableViewCell* cell, BAMRemoteSighting* sighting) {
        cell.textLabel.text = [sighting comName];
    };
    
    self.tableViewDataSource = [[TableViewDataSource alloc]
                                    initWithFetchResult:fetchRequest
                                    managedObjectContext:self.managedObjectContext
                                                tableView:self.tableView
                                        cellIdentifier:@"Cell"
                                        configureCellBlock:configureCell];
    
    self.tableView.dataSource = self.tableViewDataSource;
    self.tableView.delegate = self;
    
    self.synchronizer.delegate = self;
    [self.synchronizer sync];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BAMPersistentStack*)persistentStack
{
    return [[BAMPersistentStackManager sharedManager] persistentStack];
}

- (BAMEbirdWebservice*)webservice
{
    if( _webservice == nil )
    {
        _webservice = [[BAMEbirdWebservice alloc] init];
    }
    return _webservice;

}

- (BAMSightingSynchronizer*)synchronizer
{
    if( _synchronizer == nil )
    {
        _synchronizer = [[BAMSightingSynchronizer alloc] initWithContext:self.persistentStack.backgroundManagedObjectContext webservice:self.webservice];
    }
    
    return _synchronizer;


}

# pragma mark - notification

- (void)mergeChanges:(NSNotification*)notification
{
    if( notification != nil )
    {
        [self.tableViewDataSource mergeChanges:notification];

        dispatch_async(dispatch_get_main_queue(), ^{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No network connection"
                                                            message:@"You must be connected to the internet to use this app."
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];        });

    }
}
                         
@end
