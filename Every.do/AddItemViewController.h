//
//  AddItemViewController.h
//  Every.do
//
//  Created by Calvin Nisbet on 2015-01-28.
//  Copyright (c) 2015 Calvin Nisbet. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AddItemViewController;
@class ToDoListItem;

@protocol AddItemViewControllerDelegate <NSObject>

-(void)addItemViewControllerDidCancel: (AddItemViewController *)controller;
-(void)addItemViewController: (AddItemViewController *)controller didFinishingAddingItem:(ToDoListItem *)item;

@end

@interface AddItemViewController : UITableViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneBarButton;

@property (weak, nonatomic) IBOutlet UITextField *textField;

- (IBAction)cancel;
- (IBAction)done;

@end
