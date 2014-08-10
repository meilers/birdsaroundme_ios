//
//  BAMEbirdWebservice.h
//  BirdsAroundMe
//
//  Created by Michael J. Eilers Smith on 2014-08-09.
//  Copyright (c) 2014 sobremesa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BAMEbirdWebservice : NSObject

- (void)fetchAllSightings:(void (^)(NSArray *sightings))callback lat:(double)lat lng:(double)lng dist:(int)dist back:(int)back;


@end
