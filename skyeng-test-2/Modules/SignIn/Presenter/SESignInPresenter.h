//
//	SESignInPresenter.h
//  SignIn
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 12/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "SESignInRouterInput.h"
#import "SESignInViewInput.h"
#import "SESignInInteractorInput.h"

@interface SESignInPresenter : NSObject

@property (nonatomic, strong) id<SESignInRouterInput> router;
@property (nonatomic, weak) id<SESignInViewInput> view;
@property (nonatomic, strong) id<SESignInInteractorInput> interactor;

@end
