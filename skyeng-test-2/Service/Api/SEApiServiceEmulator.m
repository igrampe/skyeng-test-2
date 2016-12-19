//
//  SEApiServiceEmulator.m
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 12/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "SEApiServiceEmulator.h"
#import "SEAuthCodeReciever.h"
#import "SEError.h"

@interface SEApiServiceEmulator ()

@property (nonatomic, assign) NSInteger reqestCodeAttemps; // Для тестирование кейсов запроса кода с ошибками
@property (nonatomic, assign) NSInteger passwordSignInAttemps; // Для тестирование кейсов авторизации по паролю с ошибками
@property (nonatomic, assign) NSInteger codeSignInAttemps; // Для тестирование кейсов авторизации по коду с ошибками

@end

@implementation SEApiServiceEmulator

- (NSURLSessionTask *)requestCodeForEmail:(NSString *)email
                                  handler:(SEApiServiceRequestCodeHandler)handler {
    if (self.reqestCodeAttemps == 0+100) {
        NSError *error = [[NSError alloc] initWithDomain:@"NETWORK"
                                                    code:500
                                                userInfo:nil];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            handler(error, nil);
        });
    } else if (self.reqestCodeAttemps == 1+100) {
        NSError *error = [[NSError alloc] initWithDomain:SEErrorDomainApp
                                                    code:SEErrorCodeIncorrectEmail
                                                userInfo:nil];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            handler(error, nil);
        });
    } else {
        SEAuthCodeReciever *reciever = [[SEAuthCodeReciever alloc] initWithType:SEAuthCodeRecieverTypeEmail
                                                                          value:email];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            handler(nil, reciever);
        });
    }
    
    self.reqestCodeAttemps++;
    
    return nil;
}

- (NSURLSessionTask *)signInWithEmail:(NSString *)email
                             password:(NSString *)password
                              handler:(SEApiServiceSignInHandler)handler {
    if (self.passwordSignInAttemps == 0) {
        NSError *error = [[NSError alloc] initWithDomain:SEErrorDomainApp
                                                    code:SEErrorCodeIncorrectEmailOrPassword
                                                userInfo:nil];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            handler(error, nil);
        });
    } else {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            handler(nil, @"token");
        });
    }
    self.passwordSignInAttemps++;
    return nil;
}

- (NSURLSessionTask *)signInWithEmail:(NSString *)email
                                 code:(NSString *)code
                              handler:(SEApiServiceSignInHandler)handler {
    if (self.codeSignInAttemps == 0) {
        NSError *error = [[NSError alloc] initWithDomain:SEErrorDomainApp
                                                    code:SEErrorCodeIncorrectAuthCode
                                                userInfo:nil];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            handler(error, nil);
        });
    } else {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            handler(nil, @"token");
        });
    }
    self.passwordSignInAttemps++;
    return nil;
}

@end
