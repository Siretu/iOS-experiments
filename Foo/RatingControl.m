//
//  RatingControl.m
//  Foo
//
//  Created by Erik on 11/8/15.
//  Copyright © 2015 Erik. All rights reserved.
//

#import "RatingControl.h"

@implementation RatingControl



// MARK: Initialization

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        _rating = 0;
        _spacing = 5;
        _stars = 5;
        self.ratingButtons = [[NSMutableArray alloc] init];
        UIImage* filledStarImage = [UIImage imageNamed:@"filledStar"];
        UIImage* emptyStarImage = [UIImage imageNamed:@"emptyStar"];
        
        for (int i = 0; i < _stars; ++i) {
            UIButton* button = [[UIButton alloc] init];
            [button setImage:emptyStarImage forState:UIControlStateNormal];
            [button setImage:filledStarImage forState:UIControlStateSelected];
            [button setImage:filledStarImage forState:UIControlStateSelected | UIControlStateHighlighted];
            [button setAdjustsImageWhenHighlighted:NO];
            
            self.ratingButtons[i] = button;
            [self addSubview:button];
            [button addTarget:self action:@selector(ratingButtonTapped:) forControlEvents:UIControlEventTouchDown];
        }
        [self layoutSubviews];
    }
    return self;
}

- (void)layoutSubviews {
    // Set the button's width and height to a square the size of the frame's height.
    int buttonSize = self.frame.size.height;
    
    CGRect buttonFrame = CGRectMake(0, 0, buttonSize, buttonSize);

    // Offset each button's origin by the length of the button plus spacing.
    for (int i = 0; i < [self.ratingButtons count]; ++i) {
        UIButton* button = self.ratingButtons[i];
        buttonFrame.origin.x = i * (buttonSize + _spacing);
        button.frame = buttonFrame;
    }
}

- (void)setRating:(int)rating {
    _rating = rating;
    [self setNeedsLayout];
    [self updateButtonSelectionStates];
}

- (CGSize)intrinsicContentSize {
    int buttonSize = self.frame.size.height;
    int width = (buttonSize + _spacing) * _stars;
    return CGSizeMake(width, buttonSize);
}


// MARK: Button Action

- (void)ratingButtonTapped:(UIButton*)button {
    _rating = [self.ratingButtons indexOfObject:button] + 1;
    [self updateButtonSelectionStates];
    NSLog(@"Button pressed");
}

- (void)updateButtonSelectionStates {
    for (int index = 0; index < [self.ratingButtons count]; ++index) {
        // If the index of a button is less than the rating, that button should be selected.
        UIButton* button = self.ratingButtons[index];
        button.selected = index < _rating;
    }
}

@end
