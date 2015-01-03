//
//  ExampleViewController.m
//  CPExpandableTableView
//
//  Created by Chelsea Pugh on 12/9/14.
//  Copyright (c) 2014 chelsea. All rights reserved.
//

#import "ExampleViewController.h"

@interface ExampleViewController ()

@end

@implementation ExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Add sections individually
    [self addNewSectionWithTitle:@"first"];
    [self addNewSectionWithTitle:@"second"];
    
    // Loop over sections to add
    for(int i = 0; i < 3; i++) {
        NSString *title = [NSString stringWithFormat:@"%d", i];
        [self addNewSectionWithTitle:title];
    }
    
    [self.subsections[0] addObject:@"this is a subsection :D"];
    [self.subsections[1] addObject:@"a cell for the second section"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
