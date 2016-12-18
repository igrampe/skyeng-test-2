//
//	SEPasswordSignInPresenter.h
//  PasswordSignIn
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 18/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "SEPasswordSignInRouterInput.h"
#import "SEPasswordSignInViewInput.h"
#import "SEPasswordSignInInteractorInput.h"

@interface SEPasswordSignInPresenter : NSObject

@property (nonatomic, strong) id<SEPasswordSignInRouterInput> router;
@property (nonatomic, weak) id<SEPasswordSignInViewInput> view;
@property (nonatomic, strong) id<SEPasswordSignInInteractorInput> interactor;

@end
