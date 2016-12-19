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
    __weak typeof(self) welf = self;
    [welf.apiService signInWithEmail:[welf.stateService signInEmail]
                                code:authCode
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

- (void)requestCode {
    __weak typeof(self) welf = self;
    [welf.apiService requestCodeForEmail:[welf.stateService signInEmail]
                                 handler:
     ^(NSError *error, SEAuthCodeReciever *reciever) {
         if (error) {
             [welf.output requestCodeDidFailWithError:error];
         } else {
             [welf.stateService setAuthCodeReciever:reciever];
             [welf.output requestCodeDidFinishWithReciever:reciever];
         }
    }];
}

@end
