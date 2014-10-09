//
//  BAMMergeChangesDelegate.h
//  BirdsAroundMe
//
//  Created by Michael J. Eilers Smith on 2014-08-10.
//  Copyright (c) 2014 sobremesa. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MergeChangesDelegate <NSObject>

- (void)mergeChanges:(NSNotification*)notification;

@end
