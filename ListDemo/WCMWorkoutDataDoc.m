//
//  WCMWorkoutDataDoc.m
//  ListDemo
//
//  Created by Wayne McFadden on 5/15/14.
//  Copyright (c) 2014 Wayne McFadden. All rights reserved.
//

#import "WCMWorkoutDataDoc.h"
#import "WCMWorkoutData.h"

@implementation WCMWorkoutDataDoc
@synthesize data= _data;
@synthesize thumbImage=_thumbImage;

- (id) initWithTitle:(NSString*)title distance:(double)distance  thumbImage:(UIImage *)thumbImage {
    if ((self =[super init])) {
        self.data= [[WCMWorkoutData alloc] initWithTitle:title distance:distance];
        self.thumbImage= thumbImage;
        
    }
    return self;
}

@end

