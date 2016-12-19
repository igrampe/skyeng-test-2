//
//	SESignInRouter.m
//  SignIn
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 12/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import "SESignInRouter.h"
#import <APLViperStack.h>

#import "SESeguePush.h"
#import "SEConfirmCodeAssembly.h"
#import "SEPasswordSignInAssembly.h"

@interface SESignInRouter ()

@property (nonatomic, strong) APLSegue *openConfirmCodeSegue;
@property (nonatomic, strong) APLSegue *openPasswordSignInSegue;

@end

@implementation SESignInRouter

#pragma mark - SESignInRouterInput

- (void)openConfirmCodeModule {
    self.openConfirmCodeSegue = [SESeguePush new];
    self.openConfirmCodeSegue.source = (UIViewController *)self.transitionHandler;
    self.openConfirmCodeSegue.destination = self.confirmCodeAssembly.viewConfirmCode;
    __weak typeof(self) welf = self;
    [welf.transitionHandler openModuleWithAPLSegue:welf.openConfirmCodeSegue
                                         linkBlock:
    ^id<APLModuleOutput>(id<APLModuleInput> moduleInput) {
        return welf.confirmCodeModuleOutput;
    }];
}

- (void)openPasswordSignInModule {
    self.openPasswordSignInSegue = [SESeguePush new];
    self.openPasswordSignInSegue.source = (UIViewController *)self.transitionHandler;
    self.openPasswordSignInSegue.destination = self.passwordSignInAssembly.viewPasswordSignIn;
    __weak typeof(self) welf = self;
    [welf.transitionHandler openModuleWithAPLSegue:welf.openPasswordSignInSegue
                                         linkBlock:
     ^id<APLModuleOutput>(id<APLModuleInput> moduleInput) {
         return welf.passwordSignInModuleOutput;
     }];
}

- (void)closePasswordSignInModule {
    [self.openPasswordSignInSegue unwind];
}

@end
