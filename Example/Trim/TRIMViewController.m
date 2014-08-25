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
    
    // Examples for some built-in keys for typical font use-cases.
    self.headlineLabel.font = [theme fontForHeadline];
    self.subheadlineLabel.font = [theme fontForSubheadline];
    self.bodyLabel.font = [theme fontForBody];
    
    // This is how you would accomplish much more nuanced font organization.
    self.goofyLabel.font = [theme fontWithNameKey:@"goofyFont" sizeKey:@"goofyFontSize"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
