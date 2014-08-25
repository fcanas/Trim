//
//  TRIMViewController.m
//  Trim
//
//  Created by Fabian Canas on 08/25/2014.
//  Copyright (c) 2014 Fabian Canas. All rights reserved.
//

#import "TRIMViewController.h"
#import <Trim/TRIMTheme.h>

@interface TRIMViewController ()

@end

@implementation TRIMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    TRIMTheme *theme = [[TRIMTheme alloc] initWithName:@"Trim"];
    
    self.view.backgroundColor = [theme colorForKey:@"primaryBrandColor"];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
