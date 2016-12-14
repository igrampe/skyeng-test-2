//
//  SEApiServiceBase.m
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 12/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "SEApiServiceBase.h"

@implementation SEApiServiceBase

- (NSURLSessionTask *)requestCodeForPhone:(NSString *)phone
                                  handler:(SEApiServiceRequestCodeHandler)handler {
    return nil;
}

- (NSURLSessionTask *)requestCodeForEmail:(NSString *)email
                                  handler:(SEApiServiceRequestCodeHandler)handler {
    return nil;
}

- (NSURLSessionTask *)signInWithEmail:(NSString *)email
                             password:(NSString *)password
                              handler:(SEApiServiceSignInHandler)handler {
    return nil;
}

- (NSURLSessionTask *)signInWithEmail:(NSString *)email
                                 code:(NSString *)code
                              handler:(SEApiServiceSignInHandler)handler {
    return nil;
}

@end
