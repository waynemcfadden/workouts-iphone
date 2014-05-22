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

@interface WCMDetailViewController : UIViewController<UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) WCMWorkoutDataDoc *detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (weak, nonatomic) IBOutlet UITextField *typeField;

@property (weak, nonatomic) IBOutlet UITextField *timeDistanceField;
@property (weak, nonatomic) IBOutlet UIImageView *workoutImg;
@property  (strong, nonatomic ) UIImagePickerController *imgPicker;
- (IBAction)addPictureTapped:(id)sender;
- (IBAction)titleFieldTextChanged:(id)sender;
- (IBAction)distanceFieldChanged:(id)sender;

@end
