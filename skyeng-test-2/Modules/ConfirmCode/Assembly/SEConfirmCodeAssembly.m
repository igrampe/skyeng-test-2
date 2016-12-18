//
//	SEConfirmCodeAssembly.m
//  ConfirmCode
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 14/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import "SEConfirmCodeAssembly.h"
#import "SEConfirmCodeView.h"
#import "SEConfirmCodePresenter.h"
#import "SEConfirmCodeRouter.h"
#import "SEConfirmCodeInteractor.h"

#import "SEServicesAssembly.h"

@implementation SEConfirmCodeAssembly

- (SEConfirmCodeView *)viewConfirmCode {
    return [TyphoonDefinition withClass:[SEConfirmCodeView class]
                          configuration:
            ^(TyphoonDefinition *definition) {
                [definition injectProperty:@selector(output)
                                      with:[self presenterConfirmCode]];
            }];
}

- (SEConfirmCodePresenter *)presenterConfirmCode {
    return [TyphoonDefinition withClass:[SEConfirmCodePresenter class]
                          configuration:
            ^(TyphoonDefinition *definition) {
                [definition injectProperty:@selector(router)
                                      with:[self routerConfirmCode]];
                [definition injectProperty:@selector(view)
                                      with:[self viewConfirmCode]];
                [definition injectProperty:@selector(interactor)
                                      with:[self interactorConfirmCode]];
    }];
}

- (SEConfirmCodeRouter *)routerConfirmCode {
    return [TyphoonDefinition withClass:[SEConfirmCodeRouter class]
                          configuration:
            ^(TyphoonDefinition *definition) {
                [definition injectProperty:@selector(transitionHandler)
                                      with:[self viewConfirmCode]];
            }];
}

- (SEConfirmCodeInteractor *)interactorConfirmCode {
    return [TyphoonDefinition withClass:[SEConfirmCodeInteractor class]
                          configuration:
            ^(TyphoonDefinition *definition) {
                [definition injectProperty:@selector(output)
                                      with:[self presenterConfirmCode]];
                [definition injectProperty:@selector(stateService)
                                      with:[self.servicesAssembly stateService]];
                [definition injectProperty:@selector(apiService)
                                      with:[self.servicesAssembly apiService]];
            }];
}

@end
