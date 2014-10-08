//
//  BAMDatabaseUtil.m
//  BirdsAroundMe
//
//  Created by Michael J. Eilers Smith on 2014-10-06.
//  Copyright (c) 2014 sobremesa. All rights reserved.
//

#import "BAMDatabaseUtil.h"

@implementation BAMDatabaseUtil

+ (void)deleteDatabaseWithName:(NSString*)name
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath =  [documentsDirectory stringByAppendingPathComponent:@"BirdsAroundMe.sqlite"];
    
    if([[NSFileManager defaultManager] fileExistsAtPath:filePath]){
        [[NSFileManager defaultManager] removeItemAtPath:filePath error:nil];
    }
    
}

@end
