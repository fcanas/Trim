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
    self.theme = [[TRIMTheme alloc] initWithName:@"Trim"];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testColors
{
    XCTAssertEqualObjects([self.theme colorForKey:@"backgroundColor"], [UIColor redColor], @"Background color should be red.");
    //#28ba00
    XCTAssertEqualObjects([self.theme colorForKey:@"mojoGreen"],
                          [UIColor colorWithRed:0x28/255. green:0xba/255. blue:0 alpha:1.0], @"Mojo green should be mojo green.");
    XCTAssertEqualObjects([self.theme colorForKey:@"primaryBrandColor"],
                          [UIColor colorWithRed:0x28/255. green:0xba/255. blue:0 alpha:1.0], @"Primary brand color should be mojo green. - Hierarchical color names.");
}

@end
