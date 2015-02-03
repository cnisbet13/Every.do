//
//  NewList.h
//  Every.do
//
//  Created by Calvin Nisbet on 2015-01-29.
//  Copyright (c) 2015 Calvin Nisbet. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Checklist : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSMutableArray *items;


@end
