//
//  Meal.m
//  iOS-experiments
//
//  Created by Erik on 11/8/15.
//  Copyright © 2015 Erik. All rights reserved.
//

#import "Meal.h"

@interface Meal ()

@end

@implementation Meal

// MARK: Initialization

- (id)init:(NSString*)name Photo:(UIImage*)photo Rating:(int)rating {
    self = [super init];
    if (self) {
        self.name = name;
        self.photo = photo;
        self.rating = rating;
        
        if ([name length] == 0 || rating < 0) {
            return nil;
        }
    }
    return self;
}

@end
