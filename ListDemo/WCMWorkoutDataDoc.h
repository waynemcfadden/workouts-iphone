//
//  WCMWorkoutDataDoc.h
//  ListDemo
//
//  Created by Wayne McFadden on 5/15/14.
//  Copyright (c) 2014 Wayne McFadden. All rights reserved.
//

#import <Foundation/Foundation.h>
@class WCMWorkoutData;
@interface WCMWorkoutDataDoc : NSObject

@property (strong) WCMWorkoutData *data;
@property (strong) UIImage *thumbImage;

- (id) initWithTitle : (NSString*) title distance:(double)distance time:(double)time workoutDate:(NSDate*)workoutDate thumbImage:(UIImage * )thumbImage;

@end
