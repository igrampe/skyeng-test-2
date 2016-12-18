//
//	SESettingsInteractor.h
//  Settings
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 14/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "SESettingsInteractorOutput.h"
#import "SEStateService.h"

@interface SESettingsInteractor : NSObject

@property (nonatomic, weak) id<SESettingsInteractorOutput> output;
@property (nonatomic, strong) id<SEStateService> stateService;

@end
