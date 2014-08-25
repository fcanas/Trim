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

- (instancetype)initWithName:(NSString *)fileName;

- (UIColor *)colorForKey:(NSString *)key;

- (NSString *)stringForKey:(NSString *)key;

- (CGFloat)floatForKey:(NSString *)key;

#pragma mark - Fonts

/**
 Convenience method to build a font from the specified keys in the theme file.
 */
- (UIFont *)fontWithNameKey:(NSString *)nameKey sizeKey:(NSString *)sizeKey;

/**
 Returns a font build with `primaryFont` and `headlineSize` key values.
 */
- (UIFont *)fontForHeadline;

/**
 Returns a font build with `primaryFont` and `subheadlineSize` key values.
 */
- (UIFont *)fontForSubheadline;

/**
 Returns a font build with `primaryFont` and `bodySize` key values.
 */
- (UIFont *)fontForBody;

@end
