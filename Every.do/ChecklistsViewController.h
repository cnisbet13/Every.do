//
//  ViewController.h
//  Every.do
//
//  Created by Calvin Nisbet on 2015-01-28.
//  Copyright (c) 2015 Calvin Nisbet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemDetailViewController.h"
#import "Checklist.h"

@class Checklist;

@interface ChecklistsViewController : UITableViewController<ItemDetailViewControllerDelegate>

@property (nonatomic, strong) Checklist *aList;

@end

