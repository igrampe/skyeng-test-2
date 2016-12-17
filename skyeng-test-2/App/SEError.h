//
//  SEError.h
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 17/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import <Foundation/Foundation.h>


static NSString *SEErrorDomainApp = @"SEErrorDomainApp";

typedef NS_ENUM(NSUInteger, SEErrorCode) {
    SEErrorCodeIncorrectEmail = 1,
    SEErrorCodeIncorrectEmailOrPassword = 2,
    SEErrorCodeIncorrectAuthCode = 3,
};

@interface SEError : NSObject

+ (NSString *)errorMessageForCode:(SEErrorCode)code;
+ (NSString *)errorMessageForConnectionError;

@end
