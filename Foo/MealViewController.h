//
//  ViewController.h
//  Foo
//
//  Created by Erik on 11/3/15.
//  Copyright © 2015 Erik. All rights reserved.
//

#import "Meal.h"
#import <UIKit/UIKit.h>

@interface MealViewController : UIViewController<UITextFieldDelegate, UIImagePickerControllerDelegate>

/* This value is either passed by 'MealTableViewController' in 'prepareForSegue(_:sender:)' or constructed as part of adding a new meal. */
@property Meal* meal;

@end

