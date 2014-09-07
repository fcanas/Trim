//
//  TRIMTheme.h
//  Pods
//
//  Created by Fabian Canas on 8/25/14.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TRIMTheme : NSObject

+ (instancetype)themeFromPlistNamed:(NSString *)themeName;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

- (UIColor *)colorForKey:(NSString *)key;

- (NSString *)stringForKey:(NSString *)key;

- (CGFloat)floatForKey:(NSString *)key;

#pragma mark CGGeometry

- (CGPoint)pointForKey:(NSString *)key;

- (CGSize)sizeForKey:(NSString *)key;

- (CGRect)rectForKey:(NSString *)key;

#pragma mark - Fonts

/**
 Convenience method to build a font from the specified keys in the theme file.
 */
- (UIFont *)fontWithNameKey:(NSString *)nameKey sizeKey:(NSString *)sizeKey;

/**
 Convenience method to build a font from the name in 'key' and size in 'keySize;
 */
- (UIFont *)fontForKey:(NSString *)key;

/**
 Returns a font build with `headlineFont` and `headlineFontSize` key values.
 */
@property (nonatomic, readonly) UIFont *headlineFont;

/**
 Returns a font build with `fontForSubheadline` and `subheadlineFontSize` key values.
 */
@property (nonatomic, readonly) UIFont *subheadlineFont;

/**
 Returns a font build with `bodyFont` and `bodyFontSize` key values.
 */
@property (nonatomic, readonly) UIFont *bodyFont;

@end
