//
//	SESignInInteractor.h
//  SignIn
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 12/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "SESignInInteractorOutput.h"
#import "SEApiService.h"

@interface SESignInInteractor : NSObject

@property (nonatomic, weak) id<SESignInInteractorOutput> output;
@property (nonatomic, strong) id<SEApiService> apiService;

@end
