//
//	SEPasswordSignInInteractor.h
//  PasswordSignIn
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 18/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "SEPasswordSignInInteractorOutput.h"

#import "SEApiService.h"
#import "SEStateService.h"

@interface SEPasswordSignInInteractor : NSObject

@property (nonatomic, weak) id<SEPasswordSignInInteractorOutput> output;

@property (nonatomic, strong) id<SEStateService> stateService;
@property (nonatomic, strong) id<SEApiService> apiService;

@end
