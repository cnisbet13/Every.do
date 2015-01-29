//
//  AllListsViewController.m
//  Every.do
//
//  Created by Calvin Nisbet on 2015-01-29.
//  Copyright (c) 2015 Calvin Nisbet. All rights reserved.
//

#import "AllListsViewController.h"
#import "ToDoItemViewController.h"
#import "NewList.h"


@interface AllListsViewController ()

@end

@implementation AllListsViewController
{
    NSMutableArray *_lists;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder])) {
        _lists = [[NSMutableArray alloc] initWithCapacity:20];
        
        NewList *list;
        list = [[NewList alloc] init];
        list.name = @"Groceries";
        [_lists addObject:list];
        
        list = [[NewList alloc] init];
        list.name = @"Bucket List";
        [_lists addObject:list];
        
        list = [[NewList alloc] init];
        list.name = @"Errands";
        [_lists addObject:list];
        
        list = [[NewList alloc] init];
        list.name = @"App Ideas";
        [_lists addObject:list];
        
    }
    return self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [_lists count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *Cellidentifier = @"Cell";
    
    UITableViewCell *newCell =[tableView dequeueReusableCellWithIdentifier:Cellidentifier];
    
    if (newCell == nil) {
        newCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Cellidentifier];
    }
    NewList *newList = _lists[indexPath.row];
    newCell.textLabel.text = newList.name;
    newCell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    return newCell;
}
 
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
        NewList *toDoList = _lists[indexPath.row];
    
    [self performSegueWithIdentifier:@"ShowToDoList" sender:toDoList];
}
 

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

    if([segue.identifier isEqualToString:@"ShowToDoList"]) {
        ToDoItemViewController *controller = segue.destinationViewController;
        controller.aList = sender;
    }
}
                             

@end
