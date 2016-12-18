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
    [self.apiService signInWithEmail:email
                            password:password
                             handler:
     ^(NSError *error, NSString *token) {
         if (error) {
             [self.output signInDidFailWithError:error];
         } else {
             [self.stateService setToken:token];
             [self.output signInDidFinishWithToken:token];
         }
    }];
}

@end
