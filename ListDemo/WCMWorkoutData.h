//
//  WCMWorkoutData.h
//  ListDemo
//
//  Created by Wayne McFadden on 5/15/14.
//  Copyright (c) 2014 Wayne McFadden. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WCMWorkoutData : NSObject

@property (strong) NSString *title;
@property (assign) double distance;

-(id) initWithTitle: (NSString*) title distance:(double)distance;
@end
