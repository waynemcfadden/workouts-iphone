//
//  WCMDateTimeUtils.h
//  ListDemo
//
//  Created by Wayne McFadden on 5/23/14.
//  Copyright (c) 2014 Wayne McFadden. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WCMDateTimeUtils : NSObject
extern const double MILLIS;
extern const double SECONDS;
+ (double) millisecondsToMinutes:(double ) millis;
@end