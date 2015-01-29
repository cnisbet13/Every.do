//
//  ToDoListItem.h
//  Every.do
//
//  Created by Calvin Nisbet on 2015-01-28.
//  Copyright (c) 2015 Calvin Nisbet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoListItem : NSObject<NSCoding>

@property (nonatomic, strong) NSString *itemTitle;
@property (nonatomic) BOOL checked;
- (void)toggleChecked;



@end
