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
@class SEPasswordSignInAssembly;

@interface SESignInAssembly : SEModuleAssembly

@property (nonatomic, readonly) SEConfirmCodeAssembly *confirmCodeAssembly;
@property (nonatomic, readonly) SEPasswordSignInAssembly *passwordSignInAssembly;

- (UIViewController *)viewSignIn;

@end
