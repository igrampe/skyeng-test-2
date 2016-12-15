//
//	SEConfirmCodeRouter.h
//  ConfirmCode
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 14/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <APLViperStack.h>
#import "SEConfirmCodeRouterInput.h"

@interface SEConfirmCodeRouter : NSObject <SEConfirmCodeRouterInput>

@property (nonatomic, weak) id<APLTransitionHandler> transitionHandler;

@end
