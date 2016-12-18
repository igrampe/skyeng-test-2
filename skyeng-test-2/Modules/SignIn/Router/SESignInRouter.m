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

@interface SESignInRouter ()

@property (nonatomic, strong) APLModuleOpenPromise *openConfirmCodeModulePromise;
@property (nonatomic, strong) APLSegue *openConfirmCodeSegue;

@end

@implementation SESignInRouter

#pragma mark - SESignInRouterInput

- (void)openConfirmCodeModule {
    self.openConfirmCodeSegue = [SESeguePush new];
    self.openConfirmCodeSegue.source = (UIViewController *)self.transitionHandler;
    self.openConfirmCodeSegue.destination = self.confirmCodeAssembly.viewConfirmCode;
    self.openConfirmCodeModulePromise = [self.transitionHandler openModuleWithAPLSegue:self.openConfirmCodeSegue
                                                                        linkBlock:
    ^id<APLModuleOutput>(id<APLModuleInput> moduleInput) {
        return self.confirmCodeModuleOutput;
    }];
}

- (void)closeConfirmCodeModule {
    [self.openConfirmCodeSegue unwind];
}

@end
