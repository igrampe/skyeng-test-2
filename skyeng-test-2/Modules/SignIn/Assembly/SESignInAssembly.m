//
//	SESignInAssembly.m
//  SignIn
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 12/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import "SESignInAssembly.h"
#import "SESignInView.h"
#import "SESignInPresenter.h"
#import "SESignInRouter.h"
#import "SESignInInteractor.h"

@implementation SESignInAssembly

- (SESignInView *)viewSignIn {
    return [TyphoonDefinition withClass:[SESignInView class]
                          configuration:
            ^(TyphoonDefinition *definition) {
                [definition injectProperty:@selector(output)
                                      with:[self presenterSignIn]];
                [definition injectProperty:@selector(moduleInput)
                                      with:[self presenterSignIn]];
            }];
}

- (SESignInPresenter *)presenterSignIn {
    return [TyphoonDefinition withClass:[SESignInPresenter class]
                          configuration:
            ^(TyphoonDefinition *definition) {
                [definition injectProperty:@selector(router)
                                      with:[self routerSignIn]];
                [definition injectProperty:@selector(view)
                                      with:[self viewSignIn]];
                [definition injectProperty:@selector(interactor)
                                      with:[self interactorSignIn]];
    }];
}

- (SESignInRouter *)routerSignIn {
    return [TyphoonDefinition withClass:[SESignInRouter class]
                          configuration:
            ^(TyphoonDefinition *definition) {
                [definition injectProperty:@selector(transitionHandler)
                                      with:[self viewSignIn]];
                
                [definition injectProperty:@selector(confirmCodeAssembly)
                                      with:self.confirmCodeAssembly];
                [definition injectProperty:@selector(confirmCodeModuleOutput)
                                      with:[self presenterSignIn]];
                
                [definition injectProperty:@selector(passwordSignInAssembly)
                                      with:self.passwordSignInAssembly];
                [definition injectProperty:@selector(passwordSignInModuleOutput)
                                      with:[self presenterSignIn]];
            }];
}

- (SESignInInteractor *)interactorSignIn {
    return [TyphoonDefinition withClass:[SESignInInteractor class]
                          configuration:
            ^(TyphoonDefinition *definition) {
                [definition injectProperty:@selector(output)
                                      with:[self presenterSignIn]];
                [definition injectProperty:@selector(apiService)
                                      with:[self.servicesAssembly apiService]];
                [definition injectProperty:@selector(stateService)
                                      with:[self.servicesAssembly stateService]];
            }];
}

@end
