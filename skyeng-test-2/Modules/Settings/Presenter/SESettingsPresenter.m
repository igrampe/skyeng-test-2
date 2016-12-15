//
//	SESettingsPresenter.m
//  Settings
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 14/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import "SESettingsPresenter.h"
#import "SESettingsViewOutput.h"
#import "SESettingsInteractorOutput.h"
#import "SESettingsModuleInput.h"
#import "SESettingsModuleOutput.h"

@interface SESettingsPresenter () <SESettingsViewOutput, SESettingsInteractorOutput, SESettingsModuleInput>

@end

@implementation SESettingsPresenter

@synthesize moduleOutput;

#pragma mark - SESettingsViewOutput

- (void)actionLogout {
    [(id<SESettingsModuleOutput>)self.moduleOutput settingsModuleDidFinish];
}

@end
