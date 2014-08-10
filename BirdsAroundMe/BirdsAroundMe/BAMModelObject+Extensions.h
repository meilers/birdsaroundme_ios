//
//  BAMModeObject+Additions.h
//  BirdsAroundMe
//
//  Created by Michael J. Eilers Smith on 2014-07-23.
//  Copyright (c) 2014 sobremesa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

#import "BAMModelObject.h"

@interface BAMModelObject (Extensions)

+ (id)entityName;
+ (instancetype)insertNewObjectIntoContext:(NSManagedObjectContext*)context;

@end
