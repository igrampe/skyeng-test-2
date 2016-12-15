//
//  SERootRouter.h
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 11/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <APLViperStack.h>
#import "SERootRouterInput.h"
#import "SESettingsAssembly.h"

@class SESignInAssembly;

@interface SERootRouter : NSObject <SERootRouterInput>

@property (nonatomic, weak) id<APLTransitionHandler> transitionHandler;

@property (nonatomic, strong) SESignInAssembly *signInAssembly;
@property (nonatomic, strong) SESettingsAssembly *settingsAssembly;

@property (nonatomic, weak) id signInModuleOutput;
@property (nonatomic, weak) id settingsModuleOutput;

@end
