//
//  MealTableViewController.m
//  iOS-experiments
//
//  Created by Erik on 11/8/15.
//  Copyright © 2015 Erik. All rights reserved.
//

#import "MealTableViewController.h"
#import "MealViewController.h"
#import "MealTableViewCell.h"
#import "Meal.h"
#import "RatingControl.h"

@interface MealTableViewController ()

// MARK: Properties

@property (strong, nonatomic) NSMutableArray* meals;
@property (strong, nonatomic) IBOutlet UITableView *mealTableView;

@end

@implementation MealTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"viewDidLoad");
    self.meals = [[NSMutableArray alloc] init];
    [self loadSamplemeals];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Display an Edit button in the navigation bar for this view controller.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
}

- (void)loadSamplemeals {
    UIImage* photo1 = [UIImage imageNamed:@"sample1"];
    UIImage* photo2 = [UIImage imageNamed:@"sample2"];
    UIImage* photo3 = [UIImage imageNamed:@"sample3"];
    
    Meal* meal1 = [[Meal alloc] init:@"Caprese Salad" Photo:photo1 Rating:4];
    Meal* meal2 = [[Meal alloc] init:@"Chicken and Potatoes" Photo:photo2 Rating:5];
    Meal* meal3 = [[Meal alloc] init:@"Pasta with Metaballs" Photo:photo3 Rating:3];
    
    NSLog(@"Length: %lu", (unsigned long)[self.meals count]);
    [self.meals addObject:meal1];
    [self.meals addObject:meal2];
    [self.meals addObject:meal3];
    NSLog(@"Length: %lu", (unsigned long)[self.meals count]);
    NSLog(@"Index: %lu", (unsigned long)[self.meals indexOfObject:meal2]);
    NSLog(@"Finished loading");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.meals count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // Table view cells are reused and should be dequeued using a cell identifier.
    NSString* cellIdentifier = @"MealTableViewCell";
    
    MealTableViewCell *cell = (MealTableViewCell*) [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    if (cell != nil) {
        Meal* meal = self.meals[indexPath.row];
        
        cell.nameLabel.text = meal.name;
        cell.photoImageView.image = meal.photo;
        
        cell.ratingControl.rating = meal.rating;
        NSLog(@"Rating on row %ld: %d", (long)indexPath.row, cell.ratingControl.rating);
    }
    
    return cell;
}

- (IBAction)unwindToMealList:(UIStoryboardSegue *)sender {
    MealViewController* sourceViewController;
    Meal* meal;
    if ((sourceViewController = (MealViewController*) sender.sourceViewController, meal = sourceViewController.meal)) {
        NSIndexPath* selectedIndexPath;
        if ((selectedIndexPath = self.tableView.indexPathForSelectedRow)) {
            NSLog(@"Updated: %d", meal.rating);
            // Update an existing meal.
            self.meals[selectedIndexPath.row] = meal;
            [self.tableView reloadRowsAtIndexPaths:@[selectedIndexPath] withRowAnimation:UITableViewRowAnimationNone];
            NSLog(@"Meals[%ld]: %d", (long)selectedIndexPath.row, [self.meals[selectedIndexPath.row] rating]);
        } else {
            // Add a new meal.
            NSIndexPath* newIndexPath = [NSIndexPath indexPathForRow:self.meals.count inSection:0];
            [self.meals addObject:meal];
            
            [self.tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation: UITableViewRowAnimationBottom];
        }
    }
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    
    return YES;
}




// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self.meals removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier  isEqual: @"ShowDetail"]) {
        MealViewController* mealDetailViewController = segue.destinationViewController;
        MealTableViewCell* selectedMealCell = (MealTableViewCell*)sender;
        if (selectedMealCell != nil) {
            NSIndexPath *indexPath = [self.tableView indexPathForCell:selectedMealCell];
            NSLog(@"%ld", (long)indexPath.row);
            Meal* selectedMeal = self.meals[indexPath.row];
            mealDetailViewController.meal = selectedMeal;
        }
        
        
    } else if ([segue.identifier  isEqual: @"AddItem"]) {
        NSLog(@"Adding new meal.");
    }
}


@end
