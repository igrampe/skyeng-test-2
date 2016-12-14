//
//  SEServicesAssembly.m
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 12/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "SEServicesAssembly.h"
#import "SEStateServiceBase.h"
#import "SEApiServiceBase.h"
#import "SESyncServiceBase.h"

@implementation SEServicesAssembly

#pragma mark - SEServices

- (id<SEStateService>)stateService {
    return [TyphoonDefinition withClass:[SEStateServiceBase class]
                          configuration:
            ^(TyphoonDefinition *definition) {
                definition.scope = TyphoonScopeLazySingleton;
    }];
}

- (id<SEApiService>)apiService {
    return [TyphoonDefinition withClass:[SEApiServiceBase class]
                          configuration:
            ^(TyphoonDefinition *definition) {
                definition.scope = TyphoonScopeLazySingleton;
            }];
}

- (id<SESyncService>)syncService {
    return [TyphoonDefinition withClass:[SESyncServiceBase class]
                          configuration:
            ^(TyphoonDefinition *definition) {
                definition.scope = TyphoonScopeLazySingleton;
            }];
}

@end
