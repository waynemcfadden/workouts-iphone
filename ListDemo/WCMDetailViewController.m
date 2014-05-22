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


@interface WCMDetailViewController ()
- (void)configureView;
@end

@implementation WCMDetailViewController
@synthesize imgPicker = _picker;

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
        self.typeField.text = self.detailItem.data.title;
        self.timeDistanceField.text = [NSString stringWithFormat:@"%f",self.detailItem.data.distance];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addPictureTapped:(id)sender {
    if (self.imgPicker == nil) {
        //show status
       // [SVProgressHUD showWithStatus:@"Loading Image Picker"];
        // get queue
       // concurrentQueue =dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
      // concurrentQueue =  dispatch_queue_create("com.listdemo.workouttracker.bgqueue", NULL);
        // LOAD IMAGE PICKER IN BACKGROUND
        
        //dispatch_async(concurrentQueue, ^{
                                                                      
                                                                      
        self.imgPicker = [[UIImagePickerController alloc] init];
        self.imgPicker.delegate = self;
        self.imgPicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        self.imgPicker.allowsEditing=NO;
        
            // Present picker in main thread
          //  dispatch_async(dispatch_get_main_queue(), ^{
            //    [self presentViewController:_picker animated:YES completion:nil];
              //  [SVProgressHUD dismiss];
            //});
        //});
    }
    [self presentViewController:_picker animated:YES completion:nil];
}

#pragma mark UIImagePickerControllerDelegate
- (void) imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [ self dismissViewControllerAnimated:YES completion:nil];
}

- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [ self dismissViewControllerAnimated:YES completion:nil];
    
    UIImage *fullImage = (UIImage *) [info objectForKey:UIImagePickerControllerOriginalImage];
     self.detailItem.thumbImage = fullImage;
    
}


- (IBAction)titleFieldTextChanged:(id)sender {
    self.detailItem.data.title =  self.typeField.text;
}



#pragma mark UITextFieldDelegate

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}


- (IBAction)distanceFieldChanged:(id)sender {
    
    double myDistance= [self.timeDistanceField.text doubleValue];
    self.detailItem.data.distance =  myDistance;
    
    
}
-(BOOL) shouldAutorotateToInterfaceOrientation{
    return YES;
}
@end
