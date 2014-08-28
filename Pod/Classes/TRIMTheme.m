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
@property (nonatomic, strong) NSCache *colorCache;
@end

@implementation TRIMTheme

+ (instancetype)themeFromPlistNamed:(NSString *)themeName
{
    NSDictionary *dict = [[NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:themeName ofType:@"plist"]] copy];
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self == nil) {
        return nil;
    }
    
    _theme = dictionary;
    _colorCache = [NSCache new];
    
    return self;
}

- (NSString *)stringForKey:(NSString *)key
{
    return self.theme[key];
}

- (CGFloat)floatForKey:(NSString *)key
{
    return [self.theme[key] floatValue];
}

#pragma mark - Fonts

- (UIFont *)fontForHeadline
{
    return [self fontWithNameKey:@"primaryFont" sizeKey:@"headlineSize"];
}

- (UIFont *)fontForSubheadline
{
    return [self fontWithNameKey:@"primaryFont" sizeKey:@"subheadlineSize"];
}

- (UIFont *)fontForBody
{
    return [self fontWithNameKey:@"primaryFont" sizeKey:@"bodySize"];
}

- (UIFont *)fontWithNameKey:(NSString *)nameKey sizeKey:(NSString *)sizeKey
{
    return [UIFont fontWithName:[self stringForKey:nameKey]
                           size:[self floatForKey:sizeKey]];
}

#pragma mark - Colors

- (UIColor *)colorForKey:(NSString *)key
{
    UIColor *cachedColor = [self.colorCache objectForKey:key];
    if (cachedColor != nil) {
        return cachedColor;
    }
    
    NSString *keyValue = self.theme[key];
    
    if ([keyValue hasPrefix:@"#"]) {
        UIColor *color = colorWithHexString(keyValue);
        [self.colorCache setObject:color forKey:key];
        return color;
    }
    
    UIColor *color = [self colorForKey:keyValue];
    [self.colorCache setObject:color forKey:key];
    return color;
}

static UIColor *colorWithHexString(NSString *colorString) {
    
    NSString *hexString = [colorString substringFromIndex:1];
    
    unsigned int colorInt;
    [[NSScanner scannerWithString:hexString] scanHexInt:&colorInt];
    
	NSInteger red   = (colorInt & 0xff0000) >> 16;
    NSInteger green = (colorInt & 0x00ff00) >> 8;
    NSInteger blue  = (colorInt & 0x0000ff);
    
	return [UIColor colorWithRed:(CGFloat)red/255.0f green:(CGFloat)green/255.0f blue:(CGFloat)blue/255.0f alpha:1.0f];
}

@end
