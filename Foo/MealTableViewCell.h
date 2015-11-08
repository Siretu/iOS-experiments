//
//  MealTableViewCell.h
//  iOS-experiments
//
//  Created by Erik on 11/8/15.
//  Copyright © 2015 Erik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RatingControl.h"

@interface MealTableViewCell : UITableViewCell

// MARK: Properties

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (weak, nonatomic) IBOutlet RatingControl *ratingControl;

@end
