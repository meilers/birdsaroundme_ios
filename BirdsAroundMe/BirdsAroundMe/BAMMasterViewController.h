//
//  BAMMasterViewController.h
//  BirdsAroundMe
//
//  Created by Michael Eilers Smith on 2014-07-23.
//  Copyright (c) 2014 sobremesa. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BAMDetailViewController;

#import <CoreData/CoreData.h>

@interface BAMMasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) BAMDetailViewController *detailViewController;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
