//
//  Meal.h
//  iOS-experiments
//
//  Created by Erik on 11/8/15.
//  Copyright © 2015 Erik. All rights reserved.
//

#ifndef Meal_h
#define Meal_h

#import <UIKit/UIKit.h>

@interface Meal : NSObject

// MARK: Properties
@property NSString* name;
@property UIImage* photo;
@property int rating;

- (id)init:(NSString*)name Photo:(UIImage*)photo Rating:(int)rating;

@end

#endif /* Meal_h */
