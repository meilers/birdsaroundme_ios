//
//  BAMEbirdWebservice.m
//  BirdsAroundMe
//
//  Created by Michael J. Eilers Smith on 2014-08-09.
//  Copyright (c) 2014 sobremesa. All rights reserved.
//

#import "BAMEbirdWebservice.h"

@implementation BAMEbirdWebservice

- (void)fetchAllSightings:(void (^)(NSArray *sightings))callback lat:(double)lat lng:(double)lng dist:(int)dist back:(int)back
{
    NSString *urlString = [NSString stringWithFormat:@"http://ebird.org/ws1.1/data/obs/geo/recent?lat=%f&lng=%f&dist=%d&back=%d&fmt=json", lat, lng, dist, back];
    NSURL *url = [NSURL URLWithString:urlString];
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:
      ^(NSData *data, NSURLResponse *response, NSError *error) {
          if (error) {
              NSLog(@"error: %@", error.localizedDescription);
              callback(nil);
              return;
          }
          NSError *jsonError = nil;
          id result = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
          if ([result isKindOfClass:[NSArray class]]) {
              NSArray *sightings = result;
              callback(sightings);
          }
      }] resume];
}

@end
