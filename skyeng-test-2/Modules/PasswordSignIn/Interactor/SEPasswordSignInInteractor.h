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

@interface SEPasswordSignInInteractor : NSObject

@property (nonatomic, weak) id<SEPasswordSignInInteractorOutput> output;

@end
