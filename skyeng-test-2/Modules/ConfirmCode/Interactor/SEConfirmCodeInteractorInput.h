//
//	SEConfirmCodeInteractorInput.h
//  ConfirmCode
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 14/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import <Foundation/Foundation.h>

@class SEAuthCodeReciever;

@protocol SEConfirmCodeInteractorInput <NSObject>

- (SEAuthCodeReciever *)authCodeReciever;

- (void)signInWithAuthCode:(NSString *)authCode;
- (void)requestCode;

@end
