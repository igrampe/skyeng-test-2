//
//	SEConfirmCodeInteractorOutput.h
//  ConfirmCode
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 14/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import <Foundation/Foundation.h>

@class SEAuthCodeReciever;

@protocol SEConfirmCodeInteractorOutput <NSObject>

- (void)requestCodeDidFinishWithReciever:(SEAuthCodeReciever *)reciever;
- (void)requestCodeDidFailWithError:(NSError *)error;

- (void)signInDidFinishWithToken:(NSString *)token;
- (void)signInDidFailWithError:(NSError *)error;

@end
