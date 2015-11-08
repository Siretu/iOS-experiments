//
//  RatingControl.m
//  Foo
//
//  Created by Erik on 11/8/15.
//  Copyright © 2015 Erik. All rights reserved.
//

#import "RatingControl.h"

@implementation RatingControl

// MARK: Properties

int rating = 0;
NSMutableArray *ratingButtons;

// MARK: Initialization

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        ratingButtons = [[NSMutableArray alloc] init];
        for (int i = 0; i < 5; ++i) {
            UIButton* button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
            button.backgroundColor = [UIColor redColor];
            
            
            ratingButtons[i] = button;
            [self addSubview:button];
            [button addTarget:self action:@selector(ratingButtonTapped:) forControlEvents:UIControlEventTouchDown];
        }
    }
    return self;
}

-(CGSize)intrinsicContentSize {
    return CGSizeMake(240, 44);
}

// MARK: Button Action

-(void)ratingButtonTapped:(UIButton*)button {
    NSLog(@"Button pressed");
}

@end
