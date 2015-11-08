//
//  ViewController.m
//  Foo
//
//  Created by Erik on 11/3/15.
//  Copyright © 2015 Erik. All rights reserved.
//

#import "MealViewController.h"
#import "RatingControl.h"

@interface MealViewController ()

    // MARK: Properties
    @property (weak, nonatomic) IBOutlet UITextField *nameTextField;
    @property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
    @property (weak, nonatomic) IBOutlet RatingControl *ratingControl;


@end

@implementation MealViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Handle the text field's user input through delegate callbacks.
    _nameTextField.delegate = self;
}

// MARK: UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    // Hide the keyboard.
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    
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
