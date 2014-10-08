//
//  BAMSightingSynchronizer.h
//  BirdsAroundMe
//
//  Created by Michael J. Eilers Smith on 2014-08-09.
//  Copyright (c) 2014 sobremesa. All rights reserved.
//

#import <Foundation/Foundation.h>


@class BAMEbirdWebservice;
@class BAMMergeChangesDelegate;

@interface BAMSightingSynchronizer : NSObject

@property (strong, nonatomic) BAMMergeChangesDelegate *delegate;

- (id)initWithContext:(NSManagedObjectContext *)context
           webservice:(BAMEbirdWebservice *)webservice;
- (void)sync;

@end
