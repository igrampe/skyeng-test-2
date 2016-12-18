//
//	SESettingsAssembly.m
//  Settings
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 14/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import "SESettingsAssembly.h"
#import "SESettingsView.h"
#import "SESettingsPresenter.h"
#import "SESettingsRouter.h"
#import "SESettingsInteractor.h"

#import "SEServicesAssembly.h"

@implementation SESettingsAssembly

- (SESettingsView *)viewSettings {
    return [TyphoonDefinition withClass:[SESettingsView class]
                          configuration:
            ^(TyphoonDefinition *definition) {
                [definition injectProperty:@selector(output)
                                      with:[self presenterSettings]];
                [definition injectProperty:@selector(moduleInput)
                                      with:[self presenterSettings]];
            }];
}

- (SESettingsPresenter *)presenterSettings {
    return [TyphoonDefinition withClass:[SESettingsPresenter class]
                          configuration:
            ^(TyphoonDefinition *definition) {
                [definition injectProperty:@selector(router)
                                      with:[self routerSettings]];
                [definition injectProperty:@selector(view)
                                      with:[self viewSettings]];
                [definition injectProperty:@selector(interactor)
                                      with:[self interactorSettings]];
    }];
}

- (SESettingsRouter *)routerSettings {
    return [TyphoonDefinition withClass:[SESettingsRouter class]
                          configuration:
            ^(TyphoonDefinition *definition) {
                [definition injectProperty:@selector(transitionHandler)
                                      with:[self viewSettings]];
            }];
}

- (SESettingsInteractor *)interactorSettings {
    return [TyphoonDefinition withClass:[SESettingsInteractor class]
                          configuration:
            ^(TyphoonDefinition *definition) {
                [definition injectProperty:@selector(output)
                                      with:[self presenterSettings]];
                [definition injectProperty:@selector(stateService)
                                      with:[self.servicesAssembly stateService]];
            }];
}

@end
