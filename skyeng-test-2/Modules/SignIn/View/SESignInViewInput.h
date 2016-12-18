//
//	SESignInViewInput.h
//  SignIn
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 12/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import <Foundation/Foundation.h>

@class SEAlertOption;

@protocol SESignInViewInput <NSObject>

- (void)setCodeButtonEnabled:(BOOL)enabled;

- (NSString *)valueEmail;

- (void)showLoaderWithMessage:(NSString *)message;
- (void)hideLoader;
- (void)showErrorWithTitle:(NSString *)title message:(NSString *)message;

@end
