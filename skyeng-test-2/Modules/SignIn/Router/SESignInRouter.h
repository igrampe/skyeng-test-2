//
//	SESignInRouter.h
//  SignIn
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 12/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <APLViperStack.h>
#import "SESignInRouterInput.h"

@class SEConfirmCodeAssembly;

@interface SESignInRouter : NSObject <SESignInRouterInput>

@property (nonatomic, weak) id<APLTransitionHandler> transitionHandler;

@property (nonatomic, strong) SEConfirmCodeAssembly *confirmCodeAssembly;

@property (nonatomic, weak) id confirmCodeModuleOutput;

@end
