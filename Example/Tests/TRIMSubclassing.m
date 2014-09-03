//
//  TRIMSubclassing.m
//  Trim
//
//  Created by Fabian Canas on 8/30/14.
//  Copyright (c) 2014 Fabian Canas. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ThemeSubclass.h"

@interface TRIMSubclassing : XCTestCase
@property (nonatomic, strong) ThemeSubclass *theme;
@end

@implementation TRIMSubclassing

- (void)setUp
{
    [super setUp];
    self.theme = [ThemeSubclass themeFromPlistNamed:@"Trim"];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testColors
{
    XCTAssertEqualObjects([self.theme red], [UIColor redColor], @"Background color should be red.");
    //#28ba00
    XCTAssertEqualObjects([self.theme mojoGreen],
                          [UIColor colorWithRed:0x28/255. green:0xba/255. blue:0 alpha:1.0], @"Mojo green should be mojo green.");
    XCTAssertEqualObjects([self.theme colorForKey:@"primaryBrandColor"],
                          [UIColor colorWithRed:0x28/255. green:0xba/255. blue:0 alpha:1.0], @"Primary brand color should be mojo green. - Hierarchical color names.");
}

- (void)testCustomFontLoading
{
    XCTAssertEqualObjects([self.theme goofyFont],
                          [UIFont fontWithName:@"Zapfino" size:27], @"Should load and build the right font with a name and size key");
}

@end
