//
//  Tests.m
//  Tests
//
//  Created by Fabian Canas on 8/25/14.
//  Copyright (c) 2014 Fabian Canas. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Trim/TRIMTheme.h>

@interface Tests : XCTestCase
@property (nonatomic, strong) TRIMTheme *theme;
@end

@implementation Tests

- (void)setUp
{
    [super setUp];
    self.theme = [TRIMTheme themeFromPlistNamed:@"Trim"];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testColors
{
    XCTAssertEqualObjects([self.theme colorForKey:@"red"], [UIColor redColor], @"Background color should be red.");
    //#28ba00
    XCTAssertEqualObjects([self.theme colorForKey:@"mojoGreen"],
                          [UIColor colorWithRed:0x28/255. green:0xba/255. blue:0 alpha:1.0], @"Mojo green should be mojo green.");
    XCTAssertEqualObjects([self.theme colorForKey:@"primaryBrandColor"],
                          [UIColor colorWithRed:0x28/255. green:0xba/255. blue:0 alpha:1.0], @"Primary brand color should be mojo green. - Hierarchical color names.");
}

- (void)testCustomFontLoading
{
    XCTAssertEqualObjects([self.theme fontWithNameKey:@"goofyFont" sizeKey:@"goofyFontSize"],
                          [UIFont fontWithName:@"Zapfino" size:27], @"Should load and build the right font with a name and size key");
    XCTAssertEqualObjects([self.theme fontForKey:@"goofyFont"],
                          [UIFont fontWithName:@"Zapfino" size:27], @"Should load and build the right font with a name and size key");
}

- (void)testPresetFonts
{
    XCTAssertEqualObjects([self.theme bodyFont],
                          [UIFont fontWithName:@"Avenir-Book" size:12], @"Should return the right font for body with preset keys");
    XCTAssertEqualObjects([self.theme subheadlineFont],
                          [UIFont fontWithName:@"Avenir-Book" size:18], @"Should return the right font for subheadline with preset keys");
    XCTAssertEqualObjects([self.theme headlineFont],
                          [UIFont fontWithName:@"Avenir-Book" size:24], @"Should return the right font for headline with preset keys");
}

- (void)testPoints
{
    CGPoint aPoint = [self.theme pointForKey:@"aPoint"];
    XCTAssertEqual(aPoint.x, 150);
    XCTAssertEqual(aPoint.y, 400);
    
    CGPoint zeroPoint = [self.theme pointForKey:@"zeroPoint"];
    XCTAssertEqual(zeroPoint.x, 0);
    XCTAssertEqual(zeroPoint.y, 0);
}

@end
