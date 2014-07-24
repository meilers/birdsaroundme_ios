//
//  BAMPersistentStack.h
//  BirdsAroundMe
//
//  Created by Michael J. Eilers Smith on 2014-07-23.
//  Copyright (c) 2014 sobremesa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BAMPersistentStack : NSObject

- (id)initWithStoreURL:(NSURL*)storeURL modelURL:(NSURL*)modelURL;

@property (nonatomic,readonly) NSManagedObjectContext* managedObjectContext;
@property (nonatomic,readonly) NSManagedObjectContext* backgroundManagedObjectContext;

@end


// - (NSURL*)storeURL
// {
//     NSURL* documentsDirectory = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory
//                                                                        inDomain:NSUserDomainMask
//                                                               appropriateForURL:nil
//                                                                          create:YES
//                                                                           error:NULL];
//     return [documentsDirectory URLByAppendingPathComponent:@"db.sqlite"];
// }
//
// - (NSURL*)modelURL
// {
//     return [[NSBundle mainBundle] URLForResource:@"Stacks" withExtension:@"momd"];
// }
