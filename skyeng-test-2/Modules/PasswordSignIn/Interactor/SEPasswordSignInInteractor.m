//
//	SEPasswordSignInInteractor.m
//  PasswordSignIn
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 18/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import "SEPasswordSignInInteractor.h"

@implementation SEPasswordSignInInteractor

- (void)apiSignInWithEmail:(NSString *)email password:(NSString *)password {
    __weak typeof(self) welf = self;
    [welf.apiService signInWithEmail:email
                            password:password
                             handler:
     ^(NSError *error, NSString *token) {
         if (error) {
             [welf.output signInDidFailWithError:error];
         } else {
             [welf.stateService setToken:token];
             [welf.output signInDidFinishWithToken:token];
         }
    }];
}

@end
