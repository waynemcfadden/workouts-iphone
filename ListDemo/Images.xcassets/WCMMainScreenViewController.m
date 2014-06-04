//
//  WCMMainScreenViewController.m
//  ListDemo
//
//  Created by Wayne McFadden on 6/3/14.
//  Copyright (c) 2014 Wayne McFadden. All rights reserved.
//

#import "WCMMainScreenViewController.h"

@interface WCMMainScreenViewController ()

@end

@implementation WCMMainScreenViewController

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
   }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)handleWebLink:(UIButton *)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.google.com"]];
}
- (IBAction)handleWebLink2:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.yahoo.com"]];

}

@end
