//
//  RandomNumber.m
//  RandomNumbers
//
//  Created by Ravi Shankar on 29/04/14.
//  Copyright (c) 2014 Ravi Shankar. All rights reserved.
//

#import "RandomNumber.h"

@implementation RandomNumber

-(NSInteger)generateNumber {
   return arc4random_uniform(90);
}

@end
