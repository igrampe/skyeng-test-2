//
//  NSString+Localized.m
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 17/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "NSString+Localized.h"

@implementation NSString (Localized)

- (NSString *)localized {
    return NSLocalizedString(self, nil);
}

@end
