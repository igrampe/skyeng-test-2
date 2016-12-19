//
//  SERootInteractor.h
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 11/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SERootInteractorOutput.h"
#import "SEStateService.h"
#import "SESyncService.h"

@interface SERootInteractor : NSObject

@property (nonatomic, weak) id<SERootInteractorOutput> output;
@property (nonatomic, strong) id<SEStateService> stateService;
@property (nonatomic, strong) id<SESyncService> syncService;

@end
