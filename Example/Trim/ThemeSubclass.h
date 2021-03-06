//
//  ThemeSubclass.h
//  Trim
//
//  Created by Fabian Canas on 8/30/14.
//  Copyright (c) 2014 Fabian Canas. All rights reserved.
//

#import "TRIMTheme.h"

@interface ThemeSubclass : TRIMTheme

@property (nonatomic, readonly) UIColor *mojoGreen;
@property (nonatomic, readonly) UIColor *backgroundColor;
@property (nonatomic, readonly) UIColor *red;

@property (nonatomic, readonly) UIFont *goofyFont;

@property (nonatomic, readonly) CGPoint aPoint;
@property (nonatomic, readonly) CGPoint zeroPoint;

@property (nonatomic, readonly) CGSize aSize;
@property (nonatomic, readonly) CGSize zeroSize;

@property (nonatomic, readonly) CGRect aRect;
@property (nonatomic, readonly) CGRect zeroRect;

@end
