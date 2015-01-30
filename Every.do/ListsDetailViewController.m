//
//  ListsDetailViewController.m
//  Every.do
//
//  Created by Calvin Nisbet on 2015-01-29.
//  Copyright (c) 2015 Calvin Nisbet. All rights reserved.
//

#import "ListsDetailViewController.h"



@interface ListsDetailViewController ()

@end

@implementation ListsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.toDoListToEdit != nil) {
        self.title = @"Edit ToDoLists";
        self.textField.text = self.toDoListToEdit.itemTitle;
        self.doneButton.enabled = YES;
    }
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.textField becomeFirstResponder];
    
}

-(void)cancel
{
    [self.delegate listDetailViewControllerDidCancel:self];
    
}


-(void)done
{
    if (self.toDoListToEdit == nil) {
        ToDoListItem *toDoItem = [[ToDoListItem alloc] init];
        toDoItem.itemTitle = self.textField.text;
        [self.delegate listDetailViewController:self didFinishingAddingItem:toDoItem];
    } else
    {
        self.toDoListToEdit.itemTitle = self.textField.text;
        [self.delegate listDetailViewController:self didFinishingEditingItem:self.toDoListToEdit];
    }
}

-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

- (void)didReceiveMemoryWarning
{
    
    [super didReceiveMemoryWarning];
}




- (BOOL)textField:(UITextField *)theTextField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *newDescription = [theTextField.text stringByReplacingCharactersInRange:range withString:string];
    self.doneButton.enabled = ([newDescription length] > 0);
    return YES;
}




//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    
//    return 0;
//}

-(void)listDetailViewControllerDidCancel: (ListsDetailViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)listDetailViewController: (ListsDetailViewController *)controller didFinishingAddingItem:(ToDoListItem *)item
{
    NSInteger newRowIndex = [_lists count];
    [_lists addObject:item];
    
    
}


-(void)listDetailViewController: (ListsDetailViewController *)controller didFinishingEditingItem:(ToDoListItem *)item
{
    
}



@end
