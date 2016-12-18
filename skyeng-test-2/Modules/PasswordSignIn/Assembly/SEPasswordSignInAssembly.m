//
//	SEPasswordSignInAssembly.m
//  PasswordSignIn
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 18/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import "SEPasswordSignInAssembly.h"
#import "SEPasswordSignInView.h"
#import "SEPasswordSignInPresenter.h"
#import "SEPasswordSignInRouter.h"
#import "SEPasswordSignInInteractor.h"

@implementation SEPasswordSignInAssembly

- (SEPasswordSignInView *)viewPasswordSignIn {
    return [TyphoonDefinition withClass:[SEPasswordSignInView class]
                          configuration:
            ^(TyphoonDefinition *definition) {
                [definition injectProperty:@selector(output)
                                      with:[self presenterPasswordSignIn]];
                [definition injectProperty:@selector(moduleInput)
                                      with:[self presenterPasswordSignIn]];
            }];
}

- (SEPasswordSignInPresenter *)presenterPasswordSignIn {
    return [TyphoonDefinition withClass:[SEPasswordSignInPresenter class]
                          configuration:
            ^(TyphoonDefinition *definition) {
                [definition injectProperty:@selector(router)
                                      with:[self routerPasswordSignIn]];
                [definition injectProperty:@selector(view)
                                      with:[self viewPasswordSignIn]];
                [definition injectProperty:@selector(interactor)
                                      with:[self interactorPasswordSignIn]];
    }];
}

- (SEPasswordSignInRouter *)routerPasswordSignIn {
    return [TyphoonDefinition withClass:[SEPasswordSignInRouter class]
                          configuration:
            ^(TyphoonDefinition *definition) {
                [definition injectProperty:@selector(transitionHandler)
                                      with:[self viewPasswordSignIn]];
            }];
}

- (SEPasswordSignInInteractor *)interactorPasswordSignIn {
    return [TyphoonDefinition withClass:[SEPasswordSignInInteractor class]
                          configuration:
            ^(TyphoonDefinition *definition) {
                [definition injectProperty:@selector(output)
                                      with:[self presenterPasswordSignIn]];
            }];
}

@end
