//
//  BAMPersistentStackManager.h
//  BirdsAroundMe
//
//  Created by Michael J. Eilers Smith on 2014-08-10.
//  Copyright (c) 2014 sobremesa. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BAMPersistentStack;

@interface BAMPersistentStackManager : NSObject

@property (nonatomic, retain) BAMPersistentStack *persistentStack;

+ (id)sharedManager;

@end
