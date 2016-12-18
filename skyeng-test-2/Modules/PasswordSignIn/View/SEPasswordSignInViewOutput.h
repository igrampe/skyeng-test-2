//
//	SEPasswordSignInViewOutput.h
//  PasswordSignIn
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 18/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import <Foundation/Foundation.h>

@protocol SEPasswordSignInViewOutput <NSObject>

- (void)eventViewIsReady;
- (void)eventEmailFieldTextDidChange:(NSString *)text;
- (void)eventPasswordFieldTextDidChange:(NSString *)text;

- (void)actionSignIn;
- (void)actionRequestCode;

@end
