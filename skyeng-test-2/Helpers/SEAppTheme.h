//
//  SEAppTheme.h
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 15/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SEAppTheme : NSObject

+ (instancetype)sharedObject;

#define THEME [SEAppTheme sharedObject]

- (void)configure;

- (UIFont *)primaryFontWithSize:(CGFloat)size;
- (UIFont *)secondaryFontWithSize:(CGFloat)size;

- (UIColor *)colorMainBackground;
- (UIColor *)colorText;
- (UIColor *)colorHint;

- (UIColor *)colorButtonPrimaryBackgroundNormal;
- (UIColor *)colorButtonPrimaryBackgroundDisabled;
- (UIColor *)colorButtonPrimaryTitle;

- (UIColor *)colorButtonSecondaryBorder;
- (UIColor *)colorButtonSecondaryTitle;

- (UIColor *)colorTextFieldBackground;
- (UIColor *)colorTextFieldTitle;

@end
