//
//  SEAuthCodeReciever.h
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 17/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    SEAuthCodeRecieverTypeUnknown,
    SEAuthCodeRecieverTypePhone,
    SEAuthCodeRecieverTypeEmail,
} SEAuthCodeRecieverType;

@interface SEAuthCodeReciever : NSObject

@property (nonatomic, assign) SEAuthCodeRecieverType type;
@property (nonatomic, strong) NSString *value;

- (instancetype)initWithType:(SEAuthCodeRecieverType)type value:(NSString *)value;

@end
