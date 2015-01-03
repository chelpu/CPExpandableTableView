# Installation
#####Add to your Podfile
```
pod 'CPExpandableTableView', '~> 0.0'
```
#####Install
```
pod install
```

#Usage
```
// MyViewController.h
#include "CPExpandableTableViewController.h"
@interface MyViewController : CPExpandableViewController
@end


// MyViewController.m
@implementation MyViewController

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
}

@end

```
