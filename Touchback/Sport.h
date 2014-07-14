//
//  Sport.h
//  Touchback
//
//  Created by Michael Stromer on 4/27/14.
//  Copyright (c) 2014 Michael Stromer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Sport : NSObject
@property (nonatomic, strong) NSURL *newsURL;
@property (nonatomic, strong) NSURL *teamURL;

- (instancetype)initWithDictionary:(NSDictionary *)dic;
@end
