//
//	SESettingsPresenter.h
//  Settings
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 14/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "SESettingsRouterInput.h"
#import "SESettingsViewInput.h"
#import "SESettingsInteractorInput.h"

@interface SESettingsPresenter : NSObject

@property (nonatomic, strong) id<SESettingsRouterInput> router;
@property (nonatomic, weak) id<SESettingsViewInput> view;
@property (nonatomic, strong) id<SESettingsInteractorInput> interactor;

@end
