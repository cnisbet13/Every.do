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

//    ToDoListItem *_row0item;
//    ToDoListItem *_row1item;
//    ToDoListItem *_row2item;
//    ToDoListItem *_row3item;
//    ToDoListItem *_row4item;
//    ToDoListItem *_row5item;
    
    BOOL _row0itemChecked;
    BOOL _row1itemChecked;
    BOOL _row2itemChecked;
    BOOL _row3itemChecked;
    BOOL _row4itemChecked;
    BOOL _row5itemChecked;
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
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}


-(void)configureCheckmarkForCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    ToDoListItem *listItem = _items[indexPath.row];
    if (listItem.checked) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *newCell = [tableView dequeueReusableCellWithIdentifier:@"TodoItem"];
    ToDoListItem *listItem = _items[indexPath.row];
    UILabel *label = (UILabel *)[newCell viewWithTag:1000];
    label.text = listItem.descrip;
    [self configureCheckmarkForCell:newCell atIndexPath:indexPath];
    return newCell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    UITableViewCell *newCell = [tableView cellForRowAtIndexPath:indexPath];
    ToDoListItem *listItem = _items[indexPath.row];
    listItem.checked = !listItem.checked;
    [self configureCheckmarkForCell:newCell atIndexPath:indexPath];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}




@end
