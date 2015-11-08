//
//  iOS_experimentsTests.m
//  iOS-experimentsTests
//
//  Created by Erik on 11/8/15.
//  Copyright © 2015 Erik. All rights reserved.
//


#import <XCTest/XCTest.h>
#import "Meal.h"

@interface iOS_experimentsTests : XCTestCase

@end

@implementation iOS_experimentsTests


// MARK: FoodTracker Tests

// Tests to confirm that the Meal initializer returns when no name or a negative rating is provided.
- (void)testMealInitialization {
    // Success case
    Meal* potentialItem = [[Meal alloc] init:@"Newest Meal" Photo:nil Rating:5];
    XCTAssertNotNil(potentialItem);
    
    // Failure cases
    Meal* noname = [[Meal alloc] init:@"" Photo:nil Rating:5];
    XCTAssertNil(noname, @"Empty name is invalid");
    
    Meal* badRating = [[Meal alloc] init:@"Really bad rating" Photo:nil Rating:-1];
    XCTAssertNil(badRating);
    
}

@end
