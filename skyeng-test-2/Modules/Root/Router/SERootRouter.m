//
//  SERootRouter.m
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 11/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "SERootRouter.h"
#import <APLViperStack.h>
#import "SESegueAddAsChild.h"
#import "SESignInAssembly.h"

@interface SERootRouter ()

@property (nonatomic, strong) APLSegue *openSignInSegue;
@property (nonatomic, strong) APLSegue *openSettingsSegue;

@end

@implementation SERootRouter

#pragma mark - SERootRouterInput

- (void)openSignInModule {
    self.openSignInSegue = [SESegueAddAsChild new];
    UINavigationController *navCtl = [[UINavigationController alloc] initWithRootViewController:self.signInAssembly.viewSignIn];
    self.openSignInSegue.source = (UIViewController *)self.transitionHandler;
    self.openSignInSegue.destination = navCtl;
    __weak typeof(self) welf = self;
    [welf.transitionHandler openModuleWithAPLSegue:welf.openSignInSegue
                                         linkBlock:
    ^id<APLModuleOutput>(id<APLModuleInput> moduleInput) {
        return welf.signInModuleOutput;
    }];
}

- (void)closeSignInModule {
    [self.openSignInSegue unwind];
    self.openSignInSegue = nil;
}

- (void)openSettingsModule {
    self.openSettingsSegue = [SESegueAddAsChild new];
    self.openSettingsSegue.source = (UIViewController *)self.transitionHandler;
    self.openSettingsSegue.destination = self.settingsAssembly.viewSettings;
    __weak typeof(self) welf = self;
    [welf.transitionHandler openModuleWithAPLSegue:welf.openSettingsSegue
                                         linkBlock:
    ^id<APLModuleOutput>(id<APLModuleInput> moduleInput) {
        return welf.settingsModuleOutput;
    }];
}

- (void)closeSettingsModule {
    [self.openSettingsSegue unwind];
    self.openSettingsSegue = nil;
}

@end
