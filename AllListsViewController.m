//
//  AllListsViewController.m
//  Every.do
//
//  Created by Calvin Nisbet on 2015-01-29.
//  Copyright (c) 2015 Calvin Nisbet. All rights reserved.
//

#import "AllListsViewController.h"
#import "NewList.h"

@interface AllListsViewController ()

@end

@implementation AllListsViewController
{
    NSMutableArray *_lists;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
        list.name = @"New Apps";
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
    [self performSegueWithIdentifier:@"ShowToDoList" sender:nil];
}
 


@end
