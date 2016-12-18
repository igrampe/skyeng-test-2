//
//	SESignInAssembly.h
//  SignIn
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 12/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import "SEModuleAssembly.h"

@class SEConfirmCodeAssembly;

@interface SESignInAssembly : SEModuleAssembly

@property (nonatomic, readonly) SEConfirmCodeAssembly *confirmCodeAssembly;

- (UIViewController *)viewSignIn;

@end
