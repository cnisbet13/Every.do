//
//  ViewController.h
//  Every.do
//
//  Created by Calvin Nisbet on 2015-01-28.
//  Copyright (c) 2015 Calvin Nisbet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemDetailViewController.h"

@class NewList;

@interface ToDoItemViewController : UITableViewController<AddItemViewControllerDelegate>

@property (nonatomic, strong) NewList *aList;

@end

