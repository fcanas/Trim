//
//  TRIMTheme.m
//  Pods
//
//  Created by Fabian Canas on 8/25/14.
//
//

#import "TRIMTheme.h"

#import <objc/runtime.h>

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

#pragma mark CGGeometry

- (CGPoint)pointForKey:(NSString *)key
{
    NSDictionary *pointDict = self.theme[key];
    return CGPointMake([pointDict[@"x"] floatValue], [pointDict[@"y"] floatValue]);
}

- (CGSize)sizeForKey:(NSString *)key
{
    NSDictionary *sizeDict = self.theme[key];
    return CGSizeMake([sizeDict[@"width"] floatValue], [sizeDict[@"height"] floatValue]);
}

- (CGRect)rectForKey:(NSString *)key
{
    NSDictionary *rectDictionary = self.theme[key];
    NSDictionary *origin = rectDictionary[@"origin"];
    NSDictionary *size = rectDictionary[@"size"];
    return CGRectMake([origin[@"x"] floatValue], [origin[@"y"] floatValue], [size[@"width"] floatValue], [size[@"height"] floatValue]);
}

#pragma mark - Fonts

@dynamic headlineFont, subheadlineFont, bodyFont;

- (UIFont *)fontWithNameKey:(NSString *)nameKey sizeKey:(NSString *)sizeKey
{
    return [UIFont fontWithName:[self stringForKey:nameKey]
                           size:[self floatForKey:sizeKey]];
}

- (UIFont *)fontForKey:(NSString *)key
{
    return [self fontWithNameKey:key sizeKey:[NSString stringWithFormat:@"%@Size", key]];
}

#pragma mark - Dymanic Method Resolution

UIColor *resolveColorIMP(TRIMTheme *self,SEL _cmd)
{
    return [self colorForKey:NSStringFromSelector(_cmd)];
}

UIFont *resolveFontIMP(TRIMTheme *self, SEL _cmd)
{
    return [self fontForKey:NSStringFromSelector(_cmd)];
}

CGPoint resolvePointIMP(TRIMTheme *self, SEL _cmd)
{
    return [self pointForKey:NSStringFromSelector(_cmd)];
}

CGSize resolveSizeIMP(TRIMTheme *self, SEL _cmd)
{
    return [self sizeForKey:NSStringFromSelector(_cmd)];
}

+ (BOOL)resolveInstanceMethod:(SEL)aSEL
{
    objc_property_t property = class_getProperty(self, sel_getName(aSEL));
    
    char *propertyType = property_copyAttributeValue(property, "T");
    
    if (propertyType && strcmp(propertyType, "@\"UIColor\"") == 0){
        class_addMethod([self class], aSEL, (IMP) resolveColorIMP, "@@:");
        return YES;
    } else if (propertyType && strcmp(propertyType, "@\"UIFont\"") == 0){
        class_addMethod([self class], aSEL, (IMP) resolveFontIMP, "@@:");
        return YES;
    } else if (propertyType && strcmp(propertyType, "{CGPoint=ff}") == 0){
        class_addMethod([self class], aSEL, (IMP) resolvePointIMP, "@@:");
        return YES;
    } else if (propertyType && strcmp(propertyType, "{CGPoint=dd}") == 0){
        class_addMethod([self class], aSEL, (IMP) resolvePointIMP, "@@:");
        return YES;
    } else if (propertyType && strcmp(propertyType, "{CGSize=ff}") == 0){
        class_addMethod([self class], aSEL, (IMP) resolveSizeIMP, "@@:");
        return YES;
    } else if (propertyType && strcmp(propertyType, "{CGSize=dd}") == 0){
        class_addMethod([self class], aSEL, (IMP) resolveSizeIMP, "@@:");
        return YES;
    }
    
    return [super resolveInstanceMethod:aSEL];
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
