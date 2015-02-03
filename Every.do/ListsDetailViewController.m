//
//  ListsDetailViewController.m
//  Every.do
//
//  Created by Calvin Nisbet on 2015-01-29.
//  Copyright (c) 2015 Calvin Nisbet. All rights reserved.
//

#import "ListsDetailViewController.h"
#import "Checklist.h"

@interface ListsDetailViewController ()

@end

@implementation ListsDetailViewController

-(id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        //
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.checklistToEdit != nil) {
        self.title = @"Edit ToDoLists";
        self.textField.text = self.checklistToEdit.name;
        self.doneButton.enabled = YES;
    }
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.textField becomeFirstResponder];
    
}

-(IBAction)cancel
{
    [self.delegate listDetailViewControllerDidCancel:self];
}


-(IBAction)done
{
    if (self.checklistToEdit == nil) {
        Checklist *toDoItem = [[Checklist alloc] init];
        toDoItem.name = self.textField.text;
        [self.delegate listDetailViewController:self didFinishAddingChecklist:toDoItem];
    } else
    {
        self.checklistToEdit.name = self.textField.text;
        [self.delegate listDetailViewController:self didFinishEditingChecklist:self.checklistToEdit];
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




- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}



//Something wrong with this method not being able to access the properties




@end
