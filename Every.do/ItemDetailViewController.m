//
//  AddItemViewController.m
//  Every.do
//
//  Created by Calvin Nisbet on 2015-01-28.
//  Copyright (c) 2015 Calvin Nisbet. All rights reserved.
//

#import "ItemDetailViewController.h"
#import "Checklist.h"
#import "ToDoListItem.h"





@interface ItemDetailViewController ()

@end

@implementation ItemDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    if (self.itemEdit !=nil) {
        self.title = @"Edit Item";
        self.textField.text = self.itemEdit.itemTitle;
        self.doneBarButton.enabled = YES;
    }
  }

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.textField becomeFirstResponder];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Tableview data source methods


-(IBAction)cancel
{
    [self.delegate ItemDetailViewControllerDidCancel:self];
}

-(IBAction)done
{
    if (self.itemEdit == nil) {
        ToDoListItem *listItem = [[ToDoListItem alloc] init];
        listItem.itemTitle = self.textField.text;
        listItem.checked = NO;
        [self.delegate ItemDetailViewController:self didFinishAddingItem:listItem];
    } else {
        self.itemEdit.itemTitle = self.textField.text;
        [self.delegate ItemDetailViewController:self didFinishEditingItem:self.itemEdit];
    }
    
}

-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *newText = [textField.text stringByReplacingCharactersInRange:range withString:string];
    self.doneBarButton.enabled = [newText length] > 0;
    return YES;
}

@end
