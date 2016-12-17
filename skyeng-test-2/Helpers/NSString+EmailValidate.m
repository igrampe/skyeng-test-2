//
//  NSString+EmailValidate.m
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 17/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "NSString+EmailValidate.h"

@implementation NSString (EmailValidate)

- (BOOL)isValidEmail {
    NSString *emailRegex = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

@end
