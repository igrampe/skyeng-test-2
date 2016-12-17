//
//  SEApiService.h
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 12/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SEAuthCodeReciever;

typedef void(^SEApiServiceRequestCodeHandler)(NSError *error, SEAuthCodeReciever *reciever);
typedef void(^SEApiServiceSignInHandler)(NSError *error, NSString *token);

@protocol SEApiService <NSObject>

- (NSURLSessionTask *)requestCodeForEmail:(NSString *)email handler:(SEApiServiceRequestCodeHandler)handler;
- (NSURLSessionTask *)signInWithEmail:(NSString *)email password:(NSString *)password handler:(SEApiServiceSignInHandler)handler;
- (NSURLSessionTask *)signInWithEmail:(NSString *)email code:(NSString *)code handler:(SEApiServiceSignInHandler)handler;

@end
