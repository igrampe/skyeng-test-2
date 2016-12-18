//
//	SEConfirmCodeInteractor.h
//  ConfirmCode
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 14/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "SEConfirmCodeInteractorOutput.h"
#import "SEStateService.h"
#import "SEApiService.h"

@interface SEConfirmCodeInteractor : NSObject

@property (nonatomic, weak) id<SEConfirmCodeInteractorOutput> output;
@property (nonatomic, strong) id<SEStateService> stateService;
@property (nonatomic, strong) id<SEApiService> apiService;

@end
