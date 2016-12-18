//
//	SEConfirmCodeInteractor.m
//  ConfirmCode
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 14/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import "SEConfirmCodeInteractor.h"
#import "SEConfirmCodeInteractorInput.h"

@interface SEConfirmCodeInteractor () <SEConfirmCodeInteractorInput>

@end

@implementation SEConfirmCodeInteractor

#pragma mark - SEConfirmCodeInteractorInput

- (SEAuthCodeReciever *)authCodeReciever {
    return [self.stateService authCodeReciever];
}

- (void)signInWithAuthCode:(NSString *)authCode {
    [self.apiService signInWithEmail:[self.stateService signInEmail]
                                code:authCode
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

- (void)requestCode {
    [self.apiService requestCodeForEmail:[self.stateService signInEmail]
                                 handler:
     ^(NSError *error, SEAuthCodeReciever *reciever) {
         if (error) {
             [self.output requestCodeDidFailWithError:error];
         } else {
             [self.stateService setAuthCodeReciever:reciever];
             [self.output requestCodeDidFinishWithReciever:reciever];
         }
    }];
}

@end
