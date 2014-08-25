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

@end
