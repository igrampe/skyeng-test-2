//
//	SESignInRouter.h
//  SignIn
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 12/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <APLViperStack/TransitionHandler/APLTransitionHandler.h>
#import "SESignInRouterInput.h"

@interface SESignInRouter : NSObject <SESignInRouterInput>

@property (nonatomic, weak) id<APLTransitionHandler> transitionHandler;

@end
