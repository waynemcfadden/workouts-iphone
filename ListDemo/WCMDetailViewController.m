//
//  WCMDetailViewController.m
//  ListDemo
//
//  Created by Wayne McFadden on 5/15/14.
//  Copyright (c) 2014 Wayne McFadden. All rights reserved.
//

#import "WCMDetailViewController.h"
#import "WCMWorkoutData.h"
#import "WCMWorkoutDataDoc.h"
#import "SVProgressHUD.h"
#import "WCMDateTimeUtils.h"

@interface WCMDetailViewController ()
- (void)configureView;
@end

@implementation WCMDetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
        self.workoutTypeField.text = self.detailItem.data.title;
        double timeD = [self millisecondsToMinutes:self.detailItem.data.time] ;
        self.timeField.text = [NSString stringWithFormat:@"%f", timeD];
        self.distanceField.text = [NSString stringWithFormat:@"%f",self.detailItem.data.distance];
        self.workoutDateField.text = [NSString stringWithFormat:@"%f",self.detailItem.data.workoutDate];
        if ([self.detailItem.data.title  isEqual:@"Run"]) {
            self.detailItem.thumbImage = [UIImage imageNamed:@"run.png"];
        }else if ([self.detailItem.data.title  isEqual:@"Swim"]) {
            self.detailItem.thumbImage = [UIImage imageNamed:@"swim.png"];
        }else if ([self.detailItem.data.title  isEqual:@"WeightLift"]) {
            self.detailItem.thumbImage = [UIImage imageNamed:@"weightlift.png"];
        }else if ([self.detailItem.data.title  isEqual:@"Bike"]) {
            self.detailItem.thumbImage = [UIImage imageNamed:@"bike.png"];
        }
        
        NSLog(@"%f", self.detailItem.data.distance);
    }
}


- (double) millisecondsToMinutes: (double) millis  {
    double d = millis/MILLIS/SECONDS;
    return d;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.workoutNames = [[NSArray alloc] initWithObjects: @"Select Workout",
                         @"Bike", @"Run", @"Swim",
                         @"Weightlift", nil];
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    [datePicker setDate:[NSDate date]];
    [datePicker addTarget:self action:@selector(updateTextField:) forControlEvents:UIControlEventValueChanged];
    [self configureView];
    
    //http://stackoverflow.com/questions/11197855/iphone-display-date-picker-on-textfield-click
    
    [self.workoutDateField setInputView:datePicker];
    
    UIPickerView *picker = [[UIPickerView alloc] init];
    picker.dataSource = self;
    picker.delegate = self;
    self.workoutTypeField.inputView = picker;
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





#pragma mark PickerView DataSource

- (NSInteger)numberOfComponentsInPickerView:
(UIPickerView *)pickerView
{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
    return [self.workoutNames count];
}
- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    return [self.workoutNames objectAtIndex:row];
}

#pragma mark PickerView Delegate
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row
      inComponent:(NSInteger)component {
    NSInteger selRowId = [pickerView selectedRowInComponent:0];
    if (selRowId>0) {

        NSString *wType = [self.workoutNames objectAtIndex:row];
        self.detailItem.data.title =  wType;
        [self configureView];
        [self.workoutTypeField resignFirstResponder];
    }
    

    
}


-(IBAction)textFieldReturn:(id)sender
{
    [sender resignFirstResponder];
}

- (IBAction)timeFieldChanged:(id)sender {
    double myTime= [self.timeField.text doubleValue];
    self.detailItem.data.time =  myTime;
}

#pragma mark UITextFieldDelegate

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

-(void)updateTextField:(id)sender
{
    UIDatePicker *picker = (UIDatePicker*)self.workoutDateField.inputView;
    self.workoutDateField.text = [NSString stringWithFormat:@"%@",picker.date];
     [sender resignFirstResponder];
}

-(BOOL) shouldAutorotateToInterfaceOrientation{
    return YES;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    //self.workoutTypePicker = nil;
}
@end
