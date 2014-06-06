//
//  WCMDetailViewController.h
//  ListDemo
//
//  Created by Wayne McFadden on 5/15/14.
//  Copyright (c) 2014 Wayne McFadden. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <dispatch/dispatch.h>
@class WCMWorkoutDataDoc;


dispatch_queue_t concurrentQueue;

@interface WCMDetailViewController : UIViewController<UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource> {
    }
@property (strong, nonatomic) NSManagedObject *detailItemDB;
@property (strong, nonatomic) WCMWorkoutDataDoc *detailItem;
//@property  (strong, nonatomic ) UIPickerView       *workoutTypePicker;
@property  (strong, nonatomic ) NSArray            *workoutNames;


@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (weak, nonatomic) IBOutlet UITextField *workoutTypeField;
@property (weak, nonatomic) IBOutlet UITextField *workoutDateField;
@property (weak, nonatomic) IBOutlet UITextField *timeField;
@property (weak, nonatomic) IBOutlet UITextField *distanceField;
@property (weak, nonatomic) IBOutlet UIImageView *workoutImg;
- (IBAction)timeFieldChanged:(id)sender;
- (IBAction)distanceFieldChanged:(id)sender;
//- (IBAction)workoutDateFieldChanged:(id)sender;
@end
