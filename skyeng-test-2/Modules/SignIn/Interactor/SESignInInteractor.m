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

@synthesize apiService;

- (void)apiRequestCodeForEmail:(NSString *)email {
    [self.apiService requestCodeForEmail:email
                                 handler:
     ^(NSError *error, SEAuthCodeReciever *reciever) {
         if (error) {
             [self.output requestCodeDidFailWithError:error];
         } else {
             [self.output requestCodeDidFinishWithReciever:reciever];
         }
     }];
}


@end
