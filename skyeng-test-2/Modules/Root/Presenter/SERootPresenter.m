//
//  SERootPresenter.m
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 11/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "SERootPresenter.h"
#import "SERootViewOutput.h"
#import "SERootInteractorOutput.h"
#import "SESignInModuleOutput.h"
#import "SESettingsModuleOutput.h"

@interface SERootPresenter () <SERootViewOutput, SERootInteractorOutput, SESignInModuleOutput, SESettingsModuleOutput>

@end

@implementation SERootPresenter

- (void)openMain {
    if ([self.interactor isAuthorized]) {
        [self.router openSettingsModule];
    } else {
        [self.router openSignInModule];
    }
}

#pragma mark - SERootViewOutput

- (void)viewIsReady {
    [self openMain];
}

#pragma mark - SESignInModuleOutput

- (void)signInModuleDidFinish {
    [self.router closeSignInModule];
    [self openMain];
}

#pragma mark - SESettingsModuleOutput

- (void)settingsModuleDidFinish {
    [self.router closeSettingsModule];
    [self openMain];
}

@end
