//
//  WCMDateTimeUtils.m
//  ListDemo
//
//  Created by Wayne McFadden on 5/23/14.
//  Copyright (c) 2014 Wayne McFadden. All rights reserved.
//

#import "WCMDateTimeUtils.h"
#import <Foundation/Foundation.h>
@implementation WCMDateTimeUtils

const double MILLIS =  1000.0;
const double SECONDS = 60.0;

+ (double) millisecondsToMinutes: (double) millis  {
    double d = millis/MILLIS/SECONDS;
    return d;
}

@end
