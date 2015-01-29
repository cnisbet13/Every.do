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
#import "NewList.h"




@interface ToDoItemViewController ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation ToDoItemViewController

{
    NSMutableArray *_items;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder])) {
        [self loadToDoListItems];
    }
    return self;
}


-(void)loadToDoListItems
{
    NSString *path = [self dataFilePath];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        NSData *data = [[NSData alloc] initWithContentsOfFile:path];
        NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
        _items = [unarchiver decodeObjectForKey:@"ToDoListItem"];
        [unarchiver finishDecoding];
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
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
    label.text = listItem.itemTitle;
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
    [self saveToDoListItems];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_items removeObjectAtIndex:indexPath.row];
    [self saveToDoListItems];
    NSArray *indexPaths = @[indexPath];
    [tableView deleteRowsAtIndexPaths:indexPaths
                     withRowAnimation:UITableViewRowAnimationAutomatic];
}


-(void)ItemDetailViewControllerDidCancel:(ItemDetailViewController *)controller
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(void)ItemDetailViewController:(ItemDetailViewController *)controller didFinishingAddingItem:(ToDoListItem *)item
{
    NSInteger newRowIndex = [_items count];
    [_items addObject:item];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:newRowIndex inSection:0];
    NSArray *indexPaths = @[indexPath];
    [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
    [self saveToDoListItems];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)ItemDetailViewController:(ItemDetailViewController *)controller didFinishingEditingItem:(ToDoListItem *)item
{
    NSInteger index = [_items indexOfObject:item];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    UITableViewCell *newCell = [self.tableView cellForRowAtIndexPath:indexPath];
    [self configureTextForCell:newCell withToDoListItem:item];
    [self saveToDoListItems];
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


- (NSString *)documentsDirectory
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths firstObject];
    return documentsDirectory;
}

- (NSString *)dataFilePath
{
    return [[self documentsDirectory] stringByAppendingPathComponent:@"ToDoLists.plist"];
}

-(void)saveToDoListItems
{
    NSMutableData *data =[[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:_items forKey:@"ToDoListItem"];
    [archiver finishEncoding];
    [data writeToFile:[self dataFilePath] atomically:YES];
}


@end
