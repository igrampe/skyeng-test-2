//
//  SEStateService.h
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 12/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SEAuthCodeReciever;

@protocol SEStateService <NSObject>

@property (nonatomic, strong) NSString *token;
@property (nonatomic, strong) NSString *signInEmail;
@property (nonatomic, strong) SEAuthCodeReciever *authCodeReciever;

- (BOOL)isAuthorized;

@end
