//
//  Sport.m
//  Touchback
//
//  Created by Michael Stromer on 4/27/14.
//  Copyright (c) 2014 Michael Stromer. All rights reserved.
//

#import "Sport.h"

@implementation Sport

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        NSDictionary* leagues = [dic[@"leagues"] lastObject];
        NSDictionary* team = [leagues[@"teams"] lastObject];
        NSDictionary* link = team[@"links"];
        NSDictionary* api = link[@"api"];
        NSString *newsURLString = api[@"news"][@"href"];
        _newsURL = [NSURL URLWithString:newsURLString];
        
    }
    return self;
}
@end
