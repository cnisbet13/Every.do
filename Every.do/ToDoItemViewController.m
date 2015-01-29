//
//  ViewController.m
//  Every.do
//
//  Created by Calvin Nisbet on 2015-01-28.
//  Copyright (c) 2015 Calvin Nisbet. All rights reserved.
//

#import "ToDoItemViewController.h"
#import "ToDoListItem.h"
#import "ItemDetailViewController.h"




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
    UILabel *label = (UILabel *)[cell viewWithTag:1001];
    
    if (listItem.checked) {
        label.text = @"√";
    } else {
        label.text = @"";
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

//-(void)addItem
//{
//    NSInteger newRowIndex = [_items count];
//    
//    
//    //Create A New List Item, Add it to the index.
//    ToDoListItem *listItem = [[ToDoListItem alloc] init];
//    listItem.descrip = @"I'm A New List Item.";
//    listItem.checked = YES;
//    [_items addObject:listItem];
//    
//    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:newRowIndex inSection:0];
//    NSArray *indexPaths = @[indexPath];
//    [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
//}


-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_items removeObjectAtIndex:indexPath.row];
    
    NSArray *indexPaths = @[indexPath];
    [tableView deleteRowsAtIndexPaths:indexPaths
                     withRowAnimation:UITableViewRowAnimationAutomatic];    

}


-(void)addItemViewControllerDidCancel:(ItemDetailViewController *)controller
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(void)addItemViewController:(ItemDetailViewController *)controller didFinishingAddingItem:(ToDoListItem *)item
{
    NSInteger newRowIndex = [_items count];
    [_items addObject:item];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:newRowIndex inSection:0];
    NSArray *indexPaths = @[indexPath];
    [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)addItemViewController:(ItemDetailViewController *)controller didFinishingEditingItem:(ToDoListItem *)item
{
    NSInteger index = [_items indexOfObject:item];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    UITableViewCell *newCell = [self.tableView cellForRowAtIndexPath:indexPath];
    [self configureTextForCell:newCell withToDoListItem:item];
    [self dismissViewControllerAnimated:YES completion:nil];
}



-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"AddItem"]) {
        UINavigationController *navCon = segue.destinationViewController;
        ItemDetailViewController *controller = (ItemDetailViewController *) navCon.topViewController;
        controller.delegate = self;
    } else if ([segue.identifier isEqualToString:@"EditItem"]) {
        UINavigationController *navigation = segue.destinationViewController;
        ItemDetailViewController *controller = (ItemDetailViewController *)navigation.topViewController;
        controller.delegate = self;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        controller.itemEdit = _items[indexPath.row];
    }
}


@end
