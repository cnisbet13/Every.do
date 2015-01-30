//
//  ListsDetailViewController.h
//  Every.do
//
//  Created by Calvin Nisbet on 2015-01-29.
//  Copyright (c) 2015 Calvin Nisbet. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ListsDetailViewController;
@class ToDoListItem;

@protocol ListsDetailViewControllerDelegate <NSObject>


-(void)listDetailViewControllerDidCancel: (ListsDetailViewController *)controller;

-(void)listDetailViewController: (ListsDetailViewController *)controller didFinishingAddingItem:(ToDoListItem *)item;


-(void)listDetailViewController: (ListsDetailViewController *)controller didFinishingEditingItem:(ToDoListItem *)item;


@end


@interface ListsDetailViewController : UITableViewController<UITextFieldDelegate>

@property (nonatomic, strong) IBOutlet UIBarButtonItem *doneButton;

@property (nonatomic, strong) IBOutlet UITextField *textField;

@property (nonatomic, weak) id <ListsDetailViewControllerDelegate> delegate;

@property (nonatomic, strong) ToDoListItem *toDoListToEdit;

-(IBAction)cancel;
-(IBAction)done;


@end
