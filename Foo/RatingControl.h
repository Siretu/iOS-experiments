//
//  RatingControl.h
//  Foo
//
//  Created by Erik on 11/8/15.
//  Copyright © 2015 Erik. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RatingControl : UIView

// MARK: Properties

@property(nonatomic) int rating;
@property int spacing;
@property int stars;

@property NSMutableArray *ratingButtons;


@end
