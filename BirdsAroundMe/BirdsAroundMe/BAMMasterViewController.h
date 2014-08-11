//
//  BAMMasterViewController.h
//  BirdsAroundMe
//
//  Created by Michael Eilers Smith on 2014-07-23.
//  Copyright (c) 2014 sobremesa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "BAMMergeChangesDelegate.h"

@class BAMDetailViewController;
@class BAMPersistentStack;
@class BAMEbirdWebservice;
@class BAMSightingSynchronizer;


@interface BAMMasterViewController : UITableViewController <BAMMergeChangesDelegate, NSFetchedResultsControllerDelegate>


@property (strong, nonatomic) BAMDetailViewController *detailViewController;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;


@end
