//
//  ViewController.m
//  Foo
//
//  Created by Erik on 11/3/15.
//  Copyright © 2015 Erik. All rights reserved.
//

#import "MealViewController.h"
#import "RatingControl.h"
#import "Meal.h"

@interface MealViewController ()

    // MARK: Properties
    @property (weak, nonatomic) IBOutlet UITextField *nameTextField;
    @property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
    @property (weak, nonatomic) IBOutlet RatingControl *ratingControl;
    @property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;


@end

@implementation MealViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Handle the text field's user input through delegate callbacks.
    _nameTextField.delegate = self;
    
    if ((self.meal = self.meal)) {
        //self.meal = [[Meal alloc] init:self.meal.name Photo:self.meal.photo Rating:self.meal.rating];
        self.navigationItem.title = self.meal.name;
        self.nameTextField.text = self.meal.name;
        self.photoImageView.image = self.meal.photo;
        self.ratingControl.rating = self.meal.rating;
    }

    // Enable the Save button only if the text field has a valid Meal name.
    [self checkValidMealName];
}

// MARK: UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    // Hide the keyboard.
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [self checkValidMealName];
    self.navigationItem.title = textField.text;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    self.saveButton.enabled = NO;
}

- (void)checkValidMealName {
    // Disable the Save button if the text field is empty.
    NSString* text = self.nameTextField.text;
    self.saveButton.enabled = (text != nil && [text length] > 0);
}

// MARK: UIImagePickerControllerDelegate

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    // Dismiss the picker if the user canceled.
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    // The info dictionary contains multiple representations of the image, and this uses the original.
    UIImage* selectedImage = info[UIImagePickerControllerOriginalImage];
    
    // Set photoImageView to display the selected image.
    _photoImageView.image = selectedImage;
    
    // Dismiss the picker.
    [self dismissViewControllerAnimated:YES completion:nil];
}

// MARK: Navigation

- (IBAction)cancel:(UIBarButtonItem *)sender {
    NSLog(@"Cancel");
    
    // Depending on style of presentation (modal or push presentation), this view controller needs to be dismissed in two different ways
    UINavigationController* temp = (UINavigationController*) self.presentingViewController;
    if (temp != nil) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if (self.saveButton == sender) {
        NSString* name = self.nameTextField.text;
        UIImage* photo = self.photoImageView.image;
        int rating = self.ratingControl.rating;
        // Set the meal to be passed to MealTableViewController after the unwind segue.
        _meal = [[Meal alloc] init:name Photo:photo Rating:rating];

    }
}

// MARK: Actions

- (IBAction)selectImageFromPhotoLibrary:(UITapGestureRecognizer *)sender {
    // Hide the keyboard
    [_nameTextField resignFirstResponder];
    
    // UIImagePickerController is a view controller that lets a user pick media from their photo library
    UIImagePickerController* imagePickerController = [[UIImagePickerController alloc] init];
    
    // Only allow photos to be picked, not taken.
    imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    // Make sure ViewController is notified when the user picks an image.
    imagePickerController.delegate = self;
    
    [self presentViewController:imagePickerController animated:YES completion:nil];
}

@end
