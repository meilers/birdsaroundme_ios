//
//  BAMModeObject+Additions.m
//  BirdsAroundMe
//
//  Created by Michael J. Eilers Smith on 2014-07-23.
//  Copyright (c) 2014 sobremesa. All rights reserved.
//

#import "BAMModelObject+Additions.h"

@implementation BAMModelObject (Additions)

+ (id)entityName
{
    return NSStringFromClass(self);
}

+ (instancetype)insertNewObjectIntoContext:(NSManagedObjectContext*)context
{
    return [NSEntityDescription insertNewObjectForEntityForName:[self entityName] inManagedObjectContext:context];
}

@end
