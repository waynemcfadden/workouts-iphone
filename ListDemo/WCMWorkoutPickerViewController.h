//
//  WCMWorkoutPickerViewController.h
//  ListDemo
//
//  Created by Wayne McFadden on 5/23/14.
//  Copyright (c) 2014 Wayne McFadden. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WCMWorkoutPickerViewController : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource>
{
    UIPickerView       *picker;
    NSArray            *workoutNames;
    UITextField        *workoutText;
}
@property (strong, nonatomic) IBOutlet UIPickerView *picker;
@property (strong, nonatomic) IBOutlet UITextField *workoutText;
@property (strong, nonatomic) NSArray *workoutNames;
-(IBAction)textFieldReturn:(id)sender;

@end
