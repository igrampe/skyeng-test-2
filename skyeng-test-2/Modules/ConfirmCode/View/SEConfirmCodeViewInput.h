//
//	SEConfirmCodeViewInput.h
//  ConfirmCode
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 14/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import <Foundation/Foundation.h>

@protocol SEConfirmCodeViewInput <NSObject>

- (void)setHeaderText:(NSString *)headerText;
- (void)setCodeButtonTitle:(NSString *)title;
- (void)setSignInButtonEnabled:(BOOL)enabled;
- (void)setCodeButtonEnabled:(BOOL)enabled;

- (void)showLoaderWithMessage:(NSString *)message;
- (void)hideLoader;
- (void)showErrorWithTitle:(NSString *)title message:(NSString *)message;
- (void)showSuccessWithMessage:(NSString *)message;

- (NSString *)valueCode;

@end
