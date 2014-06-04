//
//  WCMMasterViewController.m
//  ListDemo
//
//  Created by Wayne McFadden on 5/15/14.
//  Copyright (c) 2014 Wayne McFadden. All rights reserved.
//
#import "WCMWorkoutData.h"
#import "WCMWorkoutDataDoc.h"

#import "WCMMasterViewController.h"

#import "WCMDetailViewController.h"


@interface WCMMasterViewController () {
    NSMutableArray *_objects;
}
@end

@implementation WCMMasterViewController
@synthesize workouts = _workouts;

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:FALSE];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addTapped:)];
    self.navigationItem.rightBarButtonItem = addButton;
    self.title =@"Workouts";
    
    NSMutableArray *workouts = [self loadBootstrapWorkoutData];
    _workouts = workouts;
}



- (NSMutableArray *) loadBootstrapWorkoutData {
    NSMutableArray *workouts = [[NSMutableArray alloc] initWithCapacity: 10];
    
    //NSCalendar *cal = [NSCalendar currentCalendar];
    //[cal setTimeZone:[NSTimeZone localTimeZone]];
    //[cal setLocale:[NSLocale currentLocale]];
    
    // if (IS_TEST_MODE) {
    //NSDateComponents *comps = [[NSDateComponents alloc] init];
    //[comps setDay:10];
    //[comps setMonth:10];
    //[comps setYear:2010];
    
    //NSDate *newDate = [cal dateFromComponents:comps];
    NSDate *newDate =  [NSDate date];
    WCMWorkoutDataDoc *workout1 = [[WCMWorkoutDataDoc alloc ] initWithTitle:@"Run (Outdoors)" distance:17 time:7200000 workoutDate:newDate thumbImage:[UIImage imageNamed:@"run.png"]];
    WCMWorkoutDataDoc *workout2 = [[WCMWorkoutDataDoc alloc ] initWithTitle:@"Cycling" distance:27.5 time:7400000 workoutDate:newDate thumbImage:[UIImage imageNamed:@"bike.png"]];
    
    WCMWorkoutDataDoc *workout3 = [[WCMWorkoutDataDoc alloc ] initWithTitle:@"Spin Class" distance:0 time:7000000  workoutDate:newDate thumbImage:[UIImage imageNamed:@"bike.png"]];
    WCMWorkoutDataDoc *workout4 = [[WCMWorkoutDataDoc alloc ] initWithTitle:@"Stationary Bike" distance:17.5 time:600000 workoutDate:newDate thumbImage:[UIImage imageNamed:@"bike.png"]];
    workouts = [NSMutableArray arrayWithObjects:workout1, workout2, workout3, workout4, nil];
    //}
    
    return workouts;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender
{
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    [_objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _workouts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyBasicCell"];
    
    WCMWorkoutDataDoc *workout = [self.workouts objectAtIndex:indexPath.row];
    cell.textLabel.text = workout.data.title;
    cell.imageView.image = workout.thumbImage;
    return cell;
}

- (void) addTapped: (id) sender {
    
    NSDate *newDate =  [NSDate date];
    WCMWorkoutDataDoc *newDoc = [[WCMWorkoutDataDoc alloc ] initWithTitle:@"Run (Outdoors)" distance:0 time:0 workoutDate:newDate thumbImage:[UIImage imageNamed:@"run.png"]];
    [_workouts addObject:newDoc];

    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:_workouts.count-1 inSection:0];
    NSArray *indexPaths = [NSArray arrayWithObject:indexPath];
    [self.tableView insertRowsAtIndexPaths: indexPaths withRowAnimation:YES];
    [self.tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionMiddle];
    [self performSegueWithIdentifier:@"MySegue" sender:self];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}
-(void)didMoveToParentViewController:(UIViewController *)parent{
    [self.tableView reloadData];
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    WCMDetailViewController *detailController = segue.destinationViewController;
    WCMWorkoutDataDoc *data = [self.workouts objectAtIndex:self.tableView.indexPathForSelectedRow.row];
    detailController.detailItem = data;
}

@end
