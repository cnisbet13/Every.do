//
//  ViewController.m
//  Every.do
//
//  Created by Calvin Nisbet on 2015-01-28.
//  Copyright (c) 2015 Calvin Nisbet. All rights reserved.
//

#import "ToDoItemViewController.h"
#import "ToDoListItem.h"


@interface ToDoItemViewController ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation ToDoItemViewController

{
    NSMutableArray *_items;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _items = [[NSMutableArray alloc] initWithCapacity:20];
    
    ToDoListItem *item;
    
    item = [[ToDoListItem alloc] init];
    item.descrip = @"Buy Mowgli’s Tickets";
    item.checked = NO;
    [_items addObject:item];
    
    
    item = [[ToDoListItem alloc] init];
    item.descrip = @"Get Groceries";
    item.checked = NO;
    [_items addObject:item];
    
    item = [[ToDoListItem alloc] init];
    item.descrip = @"Call Surgeon";
    item.checked = NO;
    [_items addObject:item];
    
    item = [[ToDoListItem alloc] init];
    item.descrip = @"Get A Haircut";
    item.checked = NO;
    [_items addObject:item];
    
    item = [[ToDoListItem alloc] init];
    item.descrip = @"Create A Portfolio";
    item.checked = NO;
    [_items addObject:item];
    
    item = [[ToDoListItem alloc] init];
    item.descrip = @"Fly To Hawaii";
    item.checked = YES;
    [_items addObject:item];
    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_items count];
}


-(void)configureCheckmarkForCell:(UITableViewCell *)cell withToDoListItem:(ToDoListItem *)listItem
{
    if (listItem.checked) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
}

-(void)configureTextForCell:(UITableViewCell *)cell withToDoListItem:(ToDoListItem *)listItem
{
    UILabel *label = (UILabel *)[cell viewWithTag:1000];
    label.text = listItem.descrip;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *newCell = [tableView dequeueReusableCellWithIdentifier:@"TodoItem"];
    ToDoListItem *listItem = _items[indexPath.row];
    [self configureCheckmarkForCell:newCell withToDoListItem:listItem];
    [self configureTextForCell:newCell withToDoListItem:listItem];
    return newCell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *newCell = [tableView cellForRowAtIndexPath:indexPath];
    ToDoListItem *listItem = _items[indexPath.row];
    [listItem toggleChecked];
    listItem.checked = !listItem.checked;
    [self configureCheckmarkForCell:newCell withToDoListItem:listItem];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(void)addItem
{
    NSInteger newRowIndex = [_items count];
    
    
    //Create A New List Item, Add it to the index.
    ToDoListItem *listItem = [[ToDoListItem alloc] init];
    listItem.descrip = @"I'm A New List Item.";
    listItem.checked = YES;
    [_items addObject:listItem];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:newRowIndex inSection:0];
    NSArray *indexPaths = @[indexPath];
    [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
}


-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_items removeObjectAtIndex:indexPath.row];
    
    NSArray *indexPaths = @[indexPath];
    [tableView deleteRowsAtIndexPaths:indexPaths
                     withRowAnimation:UITableViewRowAnimationAutomatic];    

}




@end
