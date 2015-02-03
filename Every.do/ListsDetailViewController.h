//
//  ListsDetailViewController.h
//  Every.do
//
//  Created by Calvin Nisbet on 2015-01-29.
//  Copyright (c) 2015 Calvin Nisbet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDoListItem.h"
#import "AllListsViewController.h"
#import "ItemDetailViewController.h"
#import "Checklist.h"

@class ListsDetailViewController;
@class Checklist;

@protocol ListsDetailViewControllerDelegate <NSObject>


- (void)listDetailViewControllerDidCancel: (ListsDetailViewController *)controller;
- (void)listDetailViewController: (ListsDetailViewController *)controller didFinishAddingChecklist:(Checklist *)checklist;
- (void)listDetailViewController: (ListsDetailViewController *)controller didFinishEditingChecklist:(Checklist *)checklist;

@end


@interface ListsDetailViewController : UITableViewController<UITextFieldDelegate>

@property (nonatomic, strong) IBOutlet UIBarButtonItem *doneButton;
@property (nonatomic, strong) IBOutlet UITextField *textField;

@property (nonatomic, weak) id <ListsDetailViewControllerDelegate> delegate;

@property (nonatomic, strong) Checklist *checklistToEdit;

-(IBAction)cancel;
-(IBAction)done;


@end
