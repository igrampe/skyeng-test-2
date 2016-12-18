//
//	SEPasswordSignInViewInput.h
//  PasswordSignIn
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 18/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import <Foundation/Foundation.h>

@protocol SEPasswordSignInViewInput <NSObject>

- (void)setSignInButtonEnabled:(BOOL)enabled;

- (NSString *)valueEmail;
- (NSString *)valuePassword;

- (void)showLoaderWithMessage:(NSString *)message;
- (void)hideLoader;
- (void)showErrorWithTitle:(NSString *)title message:(NSString *)message;
- (void)showSuccessWithMessage:(NSString *)message;

@end
