//
//	SEPasswordSignInRouter.h
//  PasswordSignIn
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 18/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <APLViperStack/TransitionHandler/APLTransitionHandler.h>
#import "SEPasswordSignInRouterInput.h"

@interface SEPasswordSignInRouter : NSObject <SEPasswordSignInRouterInput>

@property (nonatomic, weak) id<APLTransitionHandler> transitionHandler;

@end
