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


// MARK: PropertyKeys
NSString *const nameKey = @"name";
NSString *const photoKey = @"photo";
NSString *const ratingKey = @"rating";

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

// MARK: NSCoding

- (id) initWithCoder:(NSCoder *)aDecoder {
    NSString* name = [aDecoder decodeObjectForKey:nameKey];
    UIImage* photo = [aDecoder decodeObjectForKey:photoKey];
    int rating = [aDecoder decodeIntegerForKey:ratingKey];
    self = [self init:name Photo:photo Rating:rating];
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.name forKey:nameKey];
    [aCoder encodeObject:self.photo forKey:photoKey];
    [aCoder encodeInteger:self.rating forKey:ratingKey];
    
}

@end
