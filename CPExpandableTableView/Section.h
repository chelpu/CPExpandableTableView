//
//  Title.h
//  CPExpandableTableView
//
//  Created by Chelsea Pugh on 11/18/14.
//  Copyright (c) 2014 chelsea. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Section : NSObject

@property (strong, nonatomic) NSString *title;

-(void)toggleExpansion;
-(id) initWithTitle:(NSString *)title;
-(BOOL)isExpanded;

@end
