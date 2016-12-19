//
//	SESignInInteractor.m
//  SignIn
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 12/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import "SESignInInteractor.h"

@implementation SESignInInteractor

- (void)apiRequestCodeForEmail:(NSString *)email {
    __weak typeof(self) welf = self;
    [welf.apiService requestCodeForEmail:email
                                 handler:
     ^(NSError *error, SEAuthCodeReciever *reciever) {
         if (error) {
             [welf.output requestCodeDidFailWithError:error];
         } else {
             [welf.stateService setAuthCodeReciever:reciever];
             [welf.stateService setSignInEmail:email];
             [welf.output requestCodeDidFinishWithReciever:reciever];
         }
     }];
}

@end
