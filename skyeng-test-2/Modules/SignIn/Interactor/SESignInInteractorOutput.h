//
//	SESignInInteractorOutput.h
//  SignIn
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 12/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "SEAuthCodeReciever.h"

@protocol SESignInInteractorOutput <NSObject>

- (void)requestCodeDidFinishWithReciever:(SEAuthCodeReciever *)reciever;
- (void)requestCodeDidFailWithError:(NSError *)error;

@end
