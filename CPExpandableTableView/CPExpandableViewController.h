//
//  ViewController.h
//  CPExpandableTableView
//
//  Created by Chelsea Pugh on 11/16/14.
//  Copyright (c) 2014 chelsea. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CPExpandableViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *sections;
@property (strong, nonatomic) NSMutableArray *subsections;

- (void)addNewSectionWithTitle:(NSString *)title;

@end

