//
//  ViewController.m
//  WeightRecord
//
//  Created by Casey Yost on 2/1/17.
//  Copyright © 2017 Toasty. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "WRCategory.h"
#import "WRExercise.h"

@implementation ViewController

- (instancetype)initWithNodes:(NSArray <WRNode *> *)nodes
{
    self = [super initWithNibName:nil bundle:nil];
    if(self)
    {
        _nodes = nodes;
    }
    return self;
}

// If we're getting this initializer, it means we've been initialized from the storyboard,
// so we're the root
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self)
    {
        AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        _nodes = appDelegate.rootNodes;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CategoryCell"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"ExerciseCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row >= _nodes.count)
    {
        return;
    }
    
    WRNode *node = _nodes[indexPath.row];
    
    BOOL isCategory = [node isKindOfClass:[WRCategory class]];
    
    if(isCategory)
    {
        ViewController *vc = [[ViewController alloc] initWithNodes:[(WRCategory *)node subnodes]];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _nodes.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row >= _nodes.count)
    {
        return nil;
    }
    
    WRNode *node = _nodes[indexPath.row];
    BOOL isCategory = [node isKindOfClass:[WRCategory class]] ? YES : NO;
    NSString *identifier = isCategory ? @"CategoryCell" : @"ExerciseCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    
    if(isCategory)
    {
        WRCategory *category = (WRCategory *)node;
        cell.textLabel.text = category.name;
    }
    else
    {
        WRExercise *exercise = (WRExercise *)node;
        cell.textLabel.text = exercise.name;
    }
    
    return cell;
}

@end
