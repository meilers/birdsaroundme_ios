//
//  BAMRemoteSighting.h
//  BirdsAroundMe
//
//  Created by Michael J. Eilers Smith on 2014-07-23.
//  Copyright (c) 2014 sobremesa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "BAMModelObject.h"

@class BAMRemoteBirdImage;

@interface BAMRemoteSighting : BAMModelObject

@property (nonatomic, retain) NSString * comName;
@property (nonatomic, retain) NSNumber * howMany;
@property (nonatomic, retain) NSNumber * lat;
@property (nonatomic, retain) NSNumber * lng;
@property (nonatomic, retain) NSNumber * locationPrivate;
@property (nonatomic, retain) NSString * locId;
@property (nonatomic, retain) NSString * locName;
@property (nonatomic, retain) NSDate * obsDt;
@property (nonatomic, retain) NSNumber * obsReviewed;
@property (nonatomic, retain) NSNumber * obsValid;
@property (nonatomic, retain) NSString * sciName;
@property (nonatomic, retain) NSSet *sightingsImages;
@end

@interface BAMRemoteSighting (CoreDataGeneratedAccessors)

- (void)addSightingsImagesObject:(BAMRemoteBirdImage *)value;
- (void)removeSightingsImagesObject:(BAMRemoteBirdImage *)value;
- (void)addSightingsImages:(NSSet *)values;
- (void)removeSightingsImages:(NSSet *)values;

@end
