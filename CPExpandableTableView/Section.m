//
//  Title.m
//  CPExpandableTableView
//
//  Created by Chelsea Pugh on 11/18/14.
//  Copyright (c) 2014 chelsea. All rights reserved.
//

#import "Section.h"

@implementation Section {
    BOOL _isExpanded;
}

-(id) initWithTitle:(NSString *)title {
    if(self = [super init]) {
        self.title = title;
        _isExpanded = NO;
    }
    return self;
}

-(void)toggleExpansion {
    _isExpanded = !_isExpanded;
}

-(BOOL)isExpanded {
    return _isExpanded;
}
@end
