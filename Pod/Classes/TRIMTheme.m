//
//  TRIMTheme.m
//  Pods
//
//  Created by Fabian Canas on 8/25/14.
//
//

#import "TRIMTheme.h"

@interface TRIMTheme ()
@property (nonatomic, copy) NSDictionary *theme;
@end

@implementation TRIMTheme

- (instancetype)initWithName:(NSString *)fileName
{
    self = [super init];
    if (self == nil) {
        return nil;
    }
    
    _theme = [[NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:fileName ofType:@"plist"]] copy];
    
    return self;
}

- (UIColor *)colorForKey:(NSString *)key
{
    NSString *colorString = self.theme[key];
    NSLog(@"%@ : %@", key, colorString);
    return colorWithHexString(colorString);
}

static UIColor *colorWithHexString(NSString *colorString) {
    
    NSString *hexString = [colorString substringFromIndex:1];
    
    unsigned int colorInt;
    [[NSScanner scannerWithString:hexString] scanHexInt:&colorInt];
    
	NSInteger red   = (colorInt & 0xff0000) >> 16;
    NSInteger green = (colorInt & 0x00ff00) >> 8;
    NSInteger blue  = colorInt & 0x0000ff;
    
	return [UIColor colorWithRed:(CGFloat)red/255.0f green:(CGFloat)green/255.0f blue:(CGFloat)blue/255.0f alpha:1.0f];
}

@end
