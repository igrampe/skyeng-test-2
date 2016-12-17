//
//  SEError.m
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 17/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "SEError.h"

@implementation SEError

+ (NSString *)errorMessageForCode:(SEErrorCode)code {
    NSString *result = @"Что-то пошло не так".localized;
    switch (code) {
        case SEErrorCodeIncorrectEmail:
            result = @"Неверный адрес электронной почты".localized;
            break;
        case SEErrorCodeIncorrectEmailOrPassword:
            result = @"Неверный адрес электронной почты или пароль".localized;
            break;
        case SEErrorCodeIncorrectAuthCode:
            result = @"Неверный код".localized;
            break;
        default:
            break;
    }
    return result;
}

+ (NSString *)errorMessageForConnectionError {
    return @"Возникла проблема подключения. Проверьте интернет-соединение и попробуйте позже.".localized;
}

@end
