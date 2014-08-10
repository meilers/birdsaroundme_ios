//
//  BAMSightingSynchronizer.m
//  BirdsAroundMe
//
//  Created by Michael J. Eilers Smith on 2014-08-09.
//  Copyright (c) 2014 sobremesa. All rights reserved.
//

#import "BAMSightingSynchronizer.h"
#import "BAMEbirdWebservice.h"
#import "BAMRemoteSighting+Extensions.h"

@interface BAMSightingSynchronizer ()

@property (nonatomic, strong) NSManagedObjectContext *context;
@property (nonatomic, strong) BAMEbirdWebservice *webservice;
@end


@implementation BAMSightingSynchronizer

- (id)initWithContext:(NSManagedObjectContext *)context webservice:(BAMEbirdWebservice *)webservice
{
    self = [super init];
    if (self) {
        self.context = context;
        self.webservice = webservice;
    }
    return self;
}

- (void)sync
{
    [self.webservice fetchAllSightings:^(NSArray *sightings)
     {
         [self.context performBlock:^
          {
              NSError *error = nil;
              NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"BAMRemoteSighting"];
              [request setSortDescriptors:[NSArray arrayWithObject:
                                           [NSSortDescriptor sortDescriptorWithKey:@"comName" ascending:NO]]];
              
              NSArray *localSightings = [self.context executeFetchRequest:request error:&error];
              NSMutableDictionary *localSightingMap = [NSMutableDictionary dictionaryWithObjects:localSightings forKeys:[localSightings valueForKey:@"comName"]];
              
              
              NSMutableDictionary *remoteSightingsSyncedMap = [[NSMutableDictionary alloc] init];

              
              for(NSDictionary *remoteSightingData in sightings) {
                  
                  NSString *remoteSightingId = [remoteSightingData objectForKey:@"comName"];
                  BAMRemoteSighting *sighting;
                  
                  // Insert
                  if( ![[localSightingMap allKeys] containsObject:remoteSightingId] )
                  {
                  
                      sighting = (BAMRemoteSighting *)[NSEntityDescription insertNewObjectForEntityForName:@"BAMRemoteSighting" inManagedObjectContext:self.context];
                    
                  }
                  // Update
                  else{
                      sighting = [localSightingMap objectForKey:remoteSightingId];
                      
                      [self.context refreshObject:sighting mergeChanges:true];
                      [localSightingMap removeObjectForKey:remoteSightingId];
                  }
                  
                  [sighting loadFromDictionary:remoteSightingData];
                  
                  [remoteSightingsSyncedMap setObject:sighting forKey:remoteSightingId];
                  
                  
                  // Delete
                  for (NSString *key in localSightingMap)
                  {
                      [self.context deleteObject:[localSightingMap objectForKey:key]];
                  }
              }
              [self.context save:&error];
              if (error) {
                  NSLog(@"Error: %@", error.localizedDescription);
              }
              
          }];
     } lat:(double)45.5086699 lng:(double)-73.5539924 dist:(int)50 back:(int)30];
}


@end
