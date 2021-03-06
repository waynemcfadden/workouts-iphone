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
#import "WCMDateTimeUtils.h"

@interface WCMDetailViewController ()
- (void)configureView;
@end

@implementation WCMDetailViewController
@synthesize detailItemDB;

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    NSLog(@"Entry: set detail item");
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
    NSLog(@"New detail item is null");
        // Update the view.
        [self configureView];
    }
}


- (IBAction)save:(id)sender {
    NSManagedObjectContext *context = [self managedObjectContext];
    NSLog(@"Entry Save");
    
    // Create a new managed object
    NSManagedObject *newItem = [NSEntityDescription insertNewObjectForEntityForName:@"Workouts" inManagedObjectContext:context];
    int myTime= [self.timeField.text intValue];
     NSNumber *tNumber = [NSNumber numberWithInt:[self minutesToMilliseconds:myTime]];
     NSNumber *dist = [NSNumber numberWithDouble:[self.distanceField.text doubleValue]];
    
    [newItem setValue:tNumber forKey:@"workoutDuration"];
    [newItem setValue:dist forKey:@"workoutDistance"];
    [newItem setValue:self.workoutTypeField.text forKey:@"workoutType"];
    
    NSLog(@"Date value is: %@ ", self.detailItem.data.workoutDate);
    
    [newItem setValue:self.detailItem.data.workoutDate forKey:@"workoutDate"];
    [newItem setValue:NO forKey:@"workoutSynched"];
    [newItem setValue:NO forKey:@"workoutDeleted"];
   // [newItem setValue:"" forKey:@"workoutComments"];
    NSString *uuid = [[NSUUID UUID] UUIDString];
    [newItem setValue:uuid forKey:@"workoutId"];
    //[newItem setValue:NO forKey:@"workoutMapCoordinates"];
    //[newItem setValue:NO forKey:@"workoutNotes"];
    //[newItem setValue:NO forKey:@"workoutSynchPlace"];
    [newItem setValue:NO forKey:@"workoutShareable"];
    NSError *error = nil;
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
     [self.navigationController popViewControllerAnimated:YES];
   // [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancel:(id)sender {
    NSLog(@"Entry Cancel");
     [self.navigationController popViewControllerAnimated:YES];
    //[self dismissViewControllerAnimated:YES  completion:nil];
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        NSLog(@"Entry configure view for : %@", self.detailItem.data.title );
        self.detailDescriptionLabel.text = [self.detailItem description];
        self.workoutTypeField.text = self.detailItem.data.title;
        double timeD = [self millisecondsToMinutes:self.detailItem.data.time] ;
        NSLog(@"Time Field changed: %f", timeD);

        if (timeD>0) {
            
            self.timeField.text = [NSString stringWithFormat:@"%.02f", timeD];
        }
        if(self.detailItem.data.distance>0.0) {
            self.distanceField.text = [NSString stringWithFormat:@"%.02f",self.detailItem.data.distance];
        }
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setGeneratesCalendarDates:YES];
        [dateFormatter setLocale:[NSLocale currentLocale]];
        [dateFormatter setCalendar:[NSCalendar autoupdatingCurrentCalendar]];
        [dateFormatter setTimeZone:[NSTimeZone defaultTimeZone]];
        [dateFormatter setDateStyle:NSDateFormatterShortStyle]; // example: 4/13/10
       // NSLog(@"Date:", [NSString stringWithFormat:@"%@", [dateFormatter stringFromDate:self.detailItem.data.workoutDate]]);
         NSLog(@"Todays date is %@", self.detailItem.data.workoutDate);
        if (self.detailItem.data.workoutDate == nil) {
            
            self.workoutDateField.text =[NSString stringWithFormat:@"%@", [dateFormatter stringFromDate:[NSDate date]]];
            
            
        } else {
            self.workoutDateField.text = [NSString stringWithFormat:@"%@", [dateFormatter stringFromDate:self.detailItem.data.workoutDate]];
            

        }
        
        if ([self.detailItem.data.title  isEqual:@"Run (Outdoors)"]) {
            self.detailItem.thumbImage = [UIImage imageNamed:@"run.png"];
        }else if ([self.detailItem.data.title  isEqual:@"Run (Treadmill)"]) {
            self.detailItem.thumbImage = [UIImage imageNamed:@"run.png"];
        } else if ([self.detailItem.data.title  isEqual:@"Swim"]) {
            self.detailItem.thumbImage = [UIImage imageNamed:@"swim.png"];
        }else if ([self.detailItem.data.title  isEqual:@"WeightLift"]) {
            self.detailItem.thumbImage = [UIImage imageNamed:@"weightlift.png"];
        }else if ([self.detailItem.data.title  isEqual:@"Cycling"]) {
            self.detailItem.thumbImage = [UIImage imageNamed:@"bike.png"];
        }else if ([self.detailItem.data.title  isEqual:@"Spin Class"]) {
            self.detailItem.thumbImage = [UIImage imageNamed:@"bike.png"];
        }else if ([self.detailItem.data.title  isEqual:@"Stationary Bike"]) {
            self.detailItem.thumbImage = [UIImage imageNamed:@"bike.png"];
        }else if ([self.detailItem.data.title  isEqual:@"Yoga"]) {
            self.detailItem.thumbImage = [UIImage imageNamed:@"weightlift.png"];
        }
        NSLog(@"Distance %f", self.detailItem.data.distance);
    }
}



- (double) millisecondsToMinutes: (double) millis  {
    double d = millis/MILLIS/SECONDS;
    return d;
}

- (double) minutesToMilliseconds: (double) minutes  {
    double d = minutes * MILLIS * SECONDS;
    return d;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (self.detailItem==nil) {
        NSDate *newDate =  [NSDate date];
        WCMWorkoutDataDoc *item = [[WCMWorkoutDataDoc alloc ] initWithTitle:@"Run (Outdoors)" distance:0 time:0 workoutDate:newDate thumbImage:[UIImage imageNamed:@"run.png"]];
        [ self setDetailItem: item];
    }
	// Do any additional setup after loading the view, typically from a nib.
    self.workoutNames = [[NSArray alloc] initWithObjects: @"Select Workout",
                         @"Cycling", @"Elliptical", @"Rowing Machine", @"Run (Outdoors)", @"Run (Treadmill)", @"Spin Class", @"Stationary Bike", @"Swim",
                         @"Weightlift", @"Yoga", nil];
    
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    datePicker.datePickerMode = UIDatePickerModeDate;

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





#pragma mark PickerView DataSource Workout Type

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

#pragma mark PickerView Delegate set the workout type
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row
      inComponent:(NSInteger)component {
    NSInteger selRowId = [pickerView selectedRowInComponent:0];
    if (selRowId>0) {

        NSString *wType = [self.workoutNames objectAtIndex:row];
        self.detailItem.data.title =  wType;
        [self configureView];
        [self.workoutTypeField resignFirstResponder];
        NSLog(@"Workout Type Field changed: %@", wType);
    }
    
   
    

    
}


-(IBAction)textFieldReturn:(id)sender
{
    [sender resignFirstResponder];
}

- (IBAction)timeFieldChanged:(id)sender {
    double myTime= [self.timeField.text doubleValue];
     double timeD = [self minutesToMilliseconds:myTime] ;
    self.detailItem.data.time = timeD;
    NSLog(@"Time Field changed: %f", timeD);
     [self configureView];
    
}

- (IBAction)distanceFieldChanged:(id)sender {
    double myD =[self.distanceField.text doubleValue];
    NSLog(@"Distance Field changed: %ff", myD);
    self.detailItem.data.distance =  myD;
     [self configureView];
}

#pragma mark UITextFieldDelegate

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

-(void)updateTextField:(id)sender
{
    UIDatePicker *picker = (UIDatePicker*)self.workoutDateField.inputView;
     NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    //[dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    picker.datePickerMode = UIDatePickerModeDate;
    NSString *formattedDateString = [dateFormatter stringFromDate:picker.date];
    NSLog(@"-------- updateTextField formattedDateString: %@", formattedDateString);
    // Output for locale en_US: "formattedDateString: Jan 2, 2001".
    
    self.workoutDateField.text = [NSString stringWithFormat:@"%@",formattedDateString];
   
    NSDate *yourDate                =   [dateFormatter dateFromString:formattedDateString];
    self.detailItem.data.workoutDate = yourDate;
     [self configureView];
    
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


#pragma mark Start database persistance
- (NSManagedObjectContext * )managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}


@end
