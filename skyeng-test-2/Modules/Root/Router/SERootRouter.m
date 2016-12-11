//
//  SERootRouter.m
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 11/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "SERootRouter.h"
#import <APLModuleOpenPromise.h>
#import "SESegueAddAsChild.h"
#import "SESignInAssembly.h"

@interface SERootRouter ()

@property (nonatomic, strong) APLModuleOpenPromise *openSignInModulePromise;

@end

@implementation SERootRouter

#pragma mark - SERootRouterInput

- (void)openSignInModule {
    SESegueAddAsChild *segue = [[SESegueAddAsChild alloc] initWithIdentifier:@""
                                                                      source:(UIViewController *)self.transitionHandler
                                                                 destination:self.signInAssembly.viewSignIn];
    self.openSignInModulePromise = [self.transitionHandler openModuleWithSegue:segue];
    [self.openSignInModulePromise linkWithBlock:^id<APLModuleOutput>(id<APLModuleInput> moduleInput) {
        return nil;
    }];
}

@end
