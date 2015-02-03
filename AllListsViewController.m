//
//  AllListsViewController.m
//  Every.do
//
//  Created by Calvin Nisbet on 2015-01-29.
//  Copyright (c) 2015 Calvin Nisbet. All rights reserved.
//

#import "ChecklistsViewController.h"
#import "Checklist.h"
#import "ListsDetailViewController.h"


@interface AllListsViewController ()<ListsDetailViewControllerDelegate>

@property (nonatomic, strong) UITableView *tableView;

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
        
        Checklist *list;
        list = [[Checklist alloc] init];
        list.name = @"Groceries";
        [_lists addObject:list];
        
        list = [[Checklist alloc] init];
        list.name = @"Bucket List";
        [_lists addObject:list];
        
        list = [[Checklist alloc] init];
        list.name = @"Errands";
        [_lists addObject:list];
        
        list = [[Checklist alloc] init];
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
    Checklist *newList = _lists[indexPath.row];
    newCell.textLabel.text = newList.name;
    newCell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    return newCell;
}
 
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
        Checklist *toDoList = _lists[indexPath.row];
        
    [self performSegueWithIdentifier:@"ShowToDoList" sender:toDoList];
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

    //Are these segues duplicates? this and above.
    if([segue.identifier isEqualToString:@"ShowToDoList"]) {
        ChecklistsViewController *controller = segue.destinationViewController;
        controller.aList = sender;
    } else if ([segue.identifier isEqualToString:@"AddToDoList"]) {
        UINavigationController *navController = segue.destinationViewController;
        ListsDetailViewController *controller = (ListsDetailViewController *) navController.topViewController;
        controller.delegate = self;
        controller.checklistToEdit = nil;
    }
}


- (void)listDetailViewControllerDidCancel:(ListsDetailViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)listDetailViewController:
(ListsDetailViewController *)controller
        didFinishAddingChecklist:(Checklist *)checklist
{
    NSInteger newRowIndex = [_lists count];
    [_lists addObject:checklist];
    NSIndexPath *indexPath = [NSIndexPath
                              indexPathForRow:newRowIndex inSection:0];
    NSArray *indexPaths = @[indexPath];
    [self.tableView insertRowsAtIndexPaths:indexPaths
                          withRowAnimation:UITableViewRowAnimationAutomatic];
    
}


-(void)listDetailViewController:(ListsDetailViewController *)controller didFinishEditingChecklist:(Checklist *)checklist
{
    NSInteger index = [_lists indexOfObject:checklist];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    cell.textLabel.text = checklist.name;
    [self dismissViewControllerAnimated:YES completion:nil];
    
}



- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_lists removeObjectAtIndex:indexPath.row];
    NSArray *indexPaths =@[indexPath];
    [tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];

}

                             

@end
