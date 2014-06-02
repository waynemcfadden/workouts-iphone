//
//  WCMWorkoutData.m
//  ListDemo
//
//  Created by Wayne McFadden on 5/15/14.
//  Copyright (c) 2014 Wayne McFadden. All rights reserved.
//

#import "WCMWorkoutData.h"

@implementation WCMWorkoutData

@synthesize title=_title;
@synthesize distance=_distance;
@synthesize time=_time;
@synthesize workoutDate=_workoutDate;

- (id) initWithTitle:(NSString*) title distance:(double)distance time:(double) time workoutDate:(NSDate*)workoutDate thumbImage:(UIImage * )thumbImage {
    if ((self =[super init])) {
        self.title= title;
        self.distance=distance;
        self.time = time;
        
    }
          return self;
          
}
@end
