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
    ToDoListItem *_row0item;
    ToDoListItem *_row1item;
    ToDoListItem *_row2item;
    ToDoListItem *_row3item;
    ToDoListItem *_row4item;
    ToDoListItem *_row5item;
    
    BOOL _row0itemChecked;
    BOOL _row1itemChecked;
    BOOL _row2itemChecked;
    BOOL _row3itemChecked;
    BOOL _row4itemChecked;
    BOOL _row5itemChecked;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _row0item = [[ToDoListItem alloc] init];
    _row0item.descrip = @"Buy Mowgli’s Tickets";
    _row0item.checked = NO;
    
    _row1item = [[ToDoListItem alloc] init];
    _row1item.descrip = @"Get Groceries";
    _row1item.checked = NO;
    
    _row2item = [[ToDoListItem alloc] init];
    _row2item.descrip = @"Call Surgeon";
    _row2item.checked = NO;
    
    _row3item = [[ToDoListItem alloc] init];
    _row3item.descrip = @"Get A Haircut";
    _row3item.checked = NO;
    
    _row4item = [[ToDoListItem alloc] init];
    _row4item.descrip = @"Create A Portfolio";
    _row4item.checked = NO;
    
    _row5item = [[ToDoListItem alloc] init];
    _row5item.descrip = @"Fly To Hawaii";
    _row5item.checked = YES;
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return 1;
//    
//}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *newCell = [tableView dequeueReusableCellWithIdentifier:@"TodoItem"];
    UILabel *tagLabel = (UILabel *)[newCell viewWithTag:1000];
    
    if (indexPath.row == 0) {
        tagLabel.text = _row0item.descrip;
    } else if (indexPath.row == 1) {
        tagLabel.text = _row1item.descrip;
    } else if (indexPath.row == 2) {
        tagLabel.text = _row2item.descrip;
    } else if (indexPath.row == 3) {
        tagLabel.text = _row3item.descrip;
    } else if (indexPath.row == 4) {
        tagLabel.text = _row4item.descrip;
    } else if (indexPath.row == 5) {
        tagLabel.text = _row5item.descrip;
    }
    
    return newCell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    BOOL checked = NO;
    
    if (indexPath.row == 0) {
        checked = _row0itemChecked;
        _row0itemChecked = !_row0itemChecked;
    } else if (indexPath.row == 1) {
        checked = _row1itemChecked;
        _row1itemChecked = !_row1itemChecked;
    } else if (indexPath.row == 2) {
        checked = _row2itemChecked;
        _row2itemChecked = !_row2itemChecked;
    } else if (indexPath.row == 3) {
        checked = _row3itemChecked;
        _row3itemChecked = !_row3itemChecked;
    } else if (indexPath.row == 4) {
        checked = _row4itemChecked;
        _row4itemChecked = !_row4itemChecked;
    } else if (indexPath.row == 5) {
        checked = _row5itemChecked;
        _row5itemChecked = !_row5itemChecked;
    }
    
    
    UITableViewCell *unhighlightCell = [tableView cellForRowAtIndexPath:indexPath];
    
    if (checked) {
        unhighlightCell.accessoryType = UITableViewCellAccessoryNone;
    } else {
        unhighlightCell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}




@end
