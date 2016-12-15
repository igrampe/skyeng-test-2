//
//	SEConfirmCodePresenter.h
//  ConfirmCode
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 14/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "SEConfirmCodeRouterInput.h"
#import "SEConfirmCodeViewInput.h"
#import "SEConfirmCodeInteractorInput.h"

@interface SEConfirmCodePresenter : NSObject

@property (nonatomic, strong) id<SEConfirmCodeRouterInput> router;
@property (nonatomic, weak) id<SEConfirmCodeViewInput> view;
@property (nonatomic, strong) id<SEConfirmCodeInteractorInput> interactor;

@end
