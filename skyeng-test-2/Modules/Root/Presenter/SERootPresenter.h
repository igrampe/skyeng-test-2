//
//  SERootPresenter.h
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 11/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SERootRouterInput.h"
#import "SERootViewInput.h"
#import "SERootInteractorInput.h"

@interface SERootPresenter : NSObject

@property (nonatomic, strong) id<SERootRouterInput> router;
@property (nonatomic, strong) id<SERootViewInput> view;
@property (nonatomic, strong) id<SERootInteractorInput> interactor;

@end
