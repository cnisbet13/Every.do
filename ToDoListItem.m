//
//  ToDoListItem.m
//  Every.do
//
//  Created by Calvin Nisbet on 2015-01-28.
//  Copyright (c) 2015 Calvin Nisbet. All rights reserved.
//

#import "ToDoListItem.h"

@implementation ToDoListItem



-(void)toggleChecked
{
    self.checked = self.checked;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        self.itemTitle = [aDecoder decodeObjectForKey:@"Text"];
        self.checked = [aDecoder decodeBoolForKey:@"Checked"];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.itemTitle forKey:@"Text"];
    [aCoder encodeBool:self.checked forKey:@"Checked"];
}


@end
