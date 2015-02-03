//
//  AddItemViewController.h
//  Every.do
//
//  Created by Calvin Nisbet on 2015-01-28.
//  Copyright (c) 2015 Calvin Nisbet. All rights reserved.
//

#import <UIKit/UIKit.h>


@class ItemDetailViewController;
@class ToDoListItem;

@protocol ItemDetailViewControllerDelegate <NSObject>

-(void)ItemDetailViewControllerDidCancel: (ItemDetailViewController *)controller;
-(void)ItemDetailViewController: (ItemDetailViewController *)controller didFinishAddingItem:(ToDoListItem *)item;
-(void)ItemDetailViewController: (ItemDetailViewController *)controller didFinishEditingItem:(ToDoListItem *)item;

@end

@interface ItemDetailViewController : UITableViewController<UITextFieldDelegate>

@property (nonatomic, weak) ToDoListItem *itemEdit;

@property (weak, nonatomic) id <ItemDetailViewControllerDelegate> delegate;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneBarButton;

@property (weak, nonatomic) IBOutlet UITextField *textField;


- (IBAction)cancel;
- (IBAction)done;

@end


