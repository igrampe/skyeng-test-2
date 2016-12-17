//
//  SEAuthCodeReciever.m
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 17/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "SEAuthCodeReciever.h"

@implementation SEAuthCodeReciever

- (instancetype)init {
    self = [super init];
    if (self) {
        self.type = SEAuthCodeRecieverTypeUnknown;
    }
    return self;
}

- (instancetype)initWithType:(SEAuthCodeRecieverType)type value:(NSString *)value {
    self = [super init];
    if (self) {
        self.type = type;
        self.value = value;
    }
    return self;
}

@end
