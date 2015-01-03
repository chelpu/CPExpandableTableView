//
//  ViewController.m
//  CPExpandableTableView
//
//  Created by Chelsea Pugh on 11/16/14.
//  Copyright (c) 2014 chelsea. All rights reserved.
//

#import "CPExpandableViewController.h"
#import "ClickableHeader.h"
#import "Section.h"

static NSString *kClickableHeaderIdentifier = @"ClickableHeader";

@interface CPExpandableViewController ()

@end

@implementation CPExpandableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    // Register custom header view with tableview
    UINib *nib = [UINib nibWithNibName:kClickableHeaderIdentifier bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:kClickableHeaderIdentifier];
    
    _sections = [[NSMutableArray alloc] init];
    _subsections = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)addNewSectionWithTitle:(NSString *)title {
    [self.sections addObject:[[Section alloc] initWithTitle:title]];
    [self.subsections addObject:[[NSMutableArray alloc] init]];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [_sections count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // Change for custom cells
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.textLabel.text = _subsections[indexPath.section][indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(![_sections[indexPath.section] isExpanded]) {
        return 0;
    } else {
        return 80.0f;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    ClickableHeader *header = (ClickableHeader *)[self.tableView dequeueReusableCellWithIdentifier:kClickableHeaderIdentifier];
    header.tag = section;
    Section *s = _sections[section];
    header.sectionLabel.text = s.title;
    
    UITapGestureRecognizer *singleTapRecogniser = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gestureHandler:)];
    [singleTapRecogniser setDelegate:self];
    singleTapRecogniser.numberOfTouchesRequired = 1;
    singleTapRecogniser.numberOfTapsRequired = 1;
    [header addGestureRecognizer:singleTapRecogniser];
    
    return header;
}

- (void) gestureHandler:(UIGestureRecognizer *)gestureRecognizer {
    NSInteger section = gestureRecognizer.view.tag;
    Section *s = [_sections objectAtIndex:gestureRecognizer.view.tag];
    [s toggleExpansion];
    NSMutableArray *indexPaths = [[NSMutableArray alloc] init];
    for(int i = 0; i < [_subsections[section] count]; i++) {
        NSIndexPath *curPath = [NSIndexPath indexPathForRow:i inSection:section];
        [indexPaths addObject:curPath];
    }
    [self.tableView reloadData];
    [self.tableView reloadRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];

}
                                                   
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 50.0f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[_subsections objectAtIndex:section] count];
}

@end
