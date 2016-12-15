//
//	SESettingsRouter.h
//  Settings
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 14/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <APLViperStack.h>
#import "SESettingsRouterInput.h"

@interface SESettingsRouter : NSObject <SESettingsRouterInput>

@property (nonatomic, weak) id<APLTransitionHandler> transitionHandler;

@end
