//
//  SERootAssembly.m
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 11/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "SERootAssembly.h"
#import "SERootView.h"
#import "SERootPresenter.h"
#import "SERootRouter.h"
#import "SERootInteractor.h"
#import "SESegueAddAsChild.h"

@implementation SERootAssembly

- (SERootView *)viewRoot {
    return [TyphoonDefinition withClass:[SERootView class]
                          configuration:
            ^(TyphoonDefinition *definition) {
                [definition injectProperty:@selector(output)
                                      with:[self presenterRoot]];
            }];
}

- (SERootPresenter *)presenterRoot {
    return [TyphoonDefinition withClass:[SERootPresenter class]
                          configuration:
            ^(TyphoonDefinition *definition) {
                [definition injectProperty:@selector(router)
                                      with:[self routerRoot]];
                [definition injectProperty:@selector(view)
                                      with:[self viewRoot]];
                [definition injectProperty:@selector(interactor)
                                      with:[self interactorRoot]];
    }];
}

- (SERootRouter *)routerRoot {
    return [TyphoonDefinition withClass:[SERootRouter class]
                          configuration:
            ^(TyphoonDefinition *definition) {
                [definition injectProperty:@selector(transitionHandler)
                                      with:[self viewRoot]];
                
                [definition injectProperty:@selector(signInAssembly)
                                      with:self.singInAssembly];
                [definition injectProperty:@selector(signInModuleOutput)
                                      with:[self presenterRoot]];
                
                [definition injectProperty:@selector(settingsAssembly)
                                      with:self.settingsAssembly];
                [definition injectProperty:@selector(settingsModuleOutput)
                                      with:[self presenterRoot]];
            }];
}

- (SERootInteractor *)interactorRoot {
    return [TyphoonDefinition withClass:[SERootInteractor class]
                          configuration:
            ^(TyphoonDefinition *definition) {
                [definition injectProperty:@selector(output)
                                      with:[self presenterRoot]];
                [definition injectProperty:@selector(stateService)
                                      with:[self.servicesAssembly stateService]];
                [definition injectProperty:@selector(syncService)
                                      with:[self.servicesAssembly syncService]];
            }];
}

@end
