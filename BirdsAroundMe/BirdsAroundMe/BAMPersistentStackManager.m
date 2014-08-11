//
//  BAMPersistentStackManager.m
//  BirdsAroundMe
//
//  Created by Michael J. Eilers Smith on 2014-08-10.
//  Copyright (c) 2014 sobremesa. All rights reserved.
//

#import "BAMPersistentStackManager.h"
#import "BAMPersistentStack.h"

@implementation BAMPersistentStackManager


#pragma mark Singleton Methods

+ (id)sharedManager {
    static BAMPersistentStackManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (id)init {
    if (self = [super init]) {
        self.persistentStack = [[BAMPersistentStack alloc] initWithStoreURL:self.storeURL modelURL:self.modelURL];
    }
    return self;
}

- (void)dealloc {
    // Should never be called, but just here for clarity really.
}

- (NSURL*)storeURL
{
    return [self.applicationDocumentsDirectory URLByAppendingPathComponent:@"BirdsAroundMe.sqlite"];
}

- (NSURL*)modelURL
{
    return [[NSBundle mainBundle] URLForResource:@"BirdsAroundMe" withExtension:@"momd"];
}

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end
