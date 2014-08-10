//
//  BAMRemoteSighting+Extensions.m
//  BirdsAroundMe
//
//  Created by Michael J. Eilers Smith on 2014-08-09.
//  Copyright (c) 2014 sobremesa. All rights reserved.
//

#import "BAMRemoteSighting+Extensions.h"

@implementation BAMRemoteSighting (Extensions)

- (void)loadFromDictionary:(NSDictionary*)dict
{
    self.comName = dict[@"comName"];
    self.howMany = dict[@"howMany"];
    self.lat = dict[@"lat"];
    self.lng = dict[@"lng"];
    self.locationPrivate = dict[@"locationPrivate"];
    self.locId = dict[@"locId"];
    self.locName = dict[@"locName"];
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"dd/MM/yyyy HH:mm"];
    self.obsDt = [dateFormat dateFromString:dict[@"obsDt"]];
    self.obsReviewed = dict[@"obsReviewed"];
    self.obsValid = dict[@"obsValid"];
    self.sciName = dict[@"sciName"];
}

@end
