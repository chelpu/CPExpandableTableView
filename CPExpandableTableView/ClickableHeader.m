//
//  ClickableHeader.m
//  CPExpandableTableView
//
//  Created by Chelsea Pugh on 11/17/14.
//  Copyright (c) 2014 chelsea. All rights reserved.
//

#import "ClickableHeader.h"

@implementation ClickableHeader 

- (void)awakeFromNib {
    // Initialization code
}

- (id)init {
    if(self = [super init]) {
        self.sectionLabel = [[UILabel alloc] init];
    }
    return self;
}

@end
