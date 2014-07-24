//
//  BAMRemoteBirdImage.h
//  BirdsAroundMe
//
//  Created by Michael J. Eilers Smith on 2014-07-23.
//  Copyright (c) 2014 sobremesa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "BAMModelObject.h"


@interface BAMRemoteBirdImage : BAMModelObject

@property (nonatomic, retain) NSString * imageUrl;
@property (nonatomic, retain) NSString * sciName;
@property (nonatomic, retain) NSSet *sightingsImages;
@end

@interface BAMRemoteBirdImage (CoreDataGeneratedAccessors)

- (void)addSightingsImagesObject:(NSManagedObject *)value;
- (void)removeSightingsImagesObject:(NSManagedObject *)value;
- (void)addSightingsImages:(NSSet *)values;
- (void)removeSightingsImages:(NSSet *)values;

@end
