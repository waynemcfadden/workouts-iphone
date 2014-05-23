//
//  WCMWorkoutPickerViewController.m
//  ListDemo
//
//  Created by Wayne McFadden on 5/23/14.
//  Copyright (c) 2014 Wayne McFadden. All rights reserved.
//

#import "WCMWorkoutPickerViewController.h"

@interface WCMWorkoutPickerViewController ()

@end

@implementation WCMWorkoutPickerViewController

@synthesize workoutNames;
@synthesize workoutText;
@synthesize picker;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.workoutNames = [[NSArray alloc] initWithObjects:
                         @"Cycling", @"Run", @"Swim",
                         @"Weightlift", nil];
    
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
    return [workoutNames count];
}
- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    return [workoutNames objectAtIndex:row];
}

#pragma mark PickerView Delegate
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row
      inComponent:(NSInteger)component
{

}

-(IBAction)textFieldReturn:(id)sender
{
    [sender resignFirstResponder];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
