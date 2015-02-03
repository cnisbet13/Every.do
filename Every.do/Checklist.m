//
//  NewList.m
//  Every.do
//
//  Created by Calvin Nisbet on 2015-01-29.
//  Copyright (c) 2015 Calvin Nisbet. All rights reserved.
//

#import "Checklist.h"

@implementation Checklist


-(id)init
{
    if ((self = [super init])) {
        self.items = [[NSMutableArray alloc] initWithCapacity:25];
    }
    return self;
}

@end
