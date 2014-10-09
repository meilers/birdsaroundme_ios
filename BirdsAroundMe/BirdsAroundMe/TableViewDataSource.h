//
//  ArrayDataSource.h
//  BirdsAroundMe
//
//  Created by Michael J. Eilers Smith on 2014-10-08.
//  Copyright (c) 2014 sobremesa. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <CoreData/CoreData.h>
#import "MergeChangesDelegate.h"

typedef void (^TableViewCellConfigureBlock)(id cell, id item);

@interface TableViewDataSource : NSObject <UITableViewDataSource, NSFetchedResultsControllerDelegate , MergeChangesDelegate>

- (id)initWithFetchResult:(NSFetchRequest *)fetchRequest
     managedObjectContext:(NSManagedObjectContext *)managedObjectContext
                tableView:(UITableView *)tableView
           cellIdentifier:(NSString *)aCellIdentifier
       configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock;

- (void)mergeChanges:(NSNotification*)notification;

@end