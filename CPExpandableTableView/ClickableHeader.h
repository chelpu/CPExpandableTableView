//
//  ClickableHeader.h
//  CPExpandableTableView
//
//  Created by Chelsea Pugh on 11/17/14.
//  Copyright (c) 2014 chelsea. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClickableHeader : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *sectionLabel;
@property (strong, nonatomic) UITapGestureRecognizer *singleTapRecogniser;

@end
