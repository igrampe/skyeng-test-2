//
//  SEServices.h
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 12/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SEApiService.h"
#import "SEStateService.h"
#import "SESyncService.h"

@protocol SEServices <NSObject>

- (id<SEApiService>)apiService;
- (id<SEStateService>)stateService;
- (id<SESyncService>)syncService;

@end
