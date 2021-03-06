//
//  TRIMViewController.m
//  Trim
//
//  Created by Fabian Canas on 08/25/2014.
//  Copyright (c) 2014 Fabian Canas. All rights reserved.
//

#import "TRIMViewController.h"
#import <Trim/TRIMTheme.h>
#import "ThemeSubclass.h"

@interface TRIMViewController ()

@end

@implementation TRIMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    ThemeSubclass *theme = [ThemeSubclass themeFromPlistNamed:@"Trim"];
    
    self.view.backgroundColor = theme.backgroundColor;
    
    // Examples for some built-in keys for typical font use-cases.
    self.headlineLabel.font = [theme headlineFont];
    self.subheadlineLabel.font = [theme subheadlineFont];
    self.bodyLabel.font = [theme bodyFont];
    
    // This is how you would accomplish much more nuanced font organization.
    self.goofyLabel.font = [theme goofyFont];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
