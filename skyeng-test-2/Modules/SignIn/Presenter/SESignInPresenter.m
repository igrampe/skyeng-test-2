//
//	SESignInPresenter.m
//  SignIn
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 12/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import "SESignInPresenter.h"
#import "SESignInViewOutput.h"
#import "SESignInInteractorOutput.h"
#import "SESignInModuleInput.h"
#import "SESignInModuleOutput.h"

#import "NSString+EmailValidate.h"
#import "SEError.h"

@interface SESignInPresenter () <SESignInViewOutput, SESignInInteractorOutput, SESignInModuleInput>

@end

@implementation SESignInPresenter

@synthesize moduleOutput;

#pragma mark - SESignInViewOutput

- (void)viewIsReady {
    [self.view setEmailFieldEnabled:NO];
}

- (void)eventEmailFieldTextDidChange:(NSString *)text {
    [self.view setEmailFieldEnabled:(text && [text isValidEmail])];
}

- (void)actionCodeButton {
    NSString *email = [self.view valueEmail];
    if ((email && [email isValidEmail])) {
        [self.view showLoaderWithMessage:@"Отправка кода...".localized];
        [self.interactor apiRequestCodeForEmail:email];
    }
}

#pragma mark - SESignInInteractorOutput

- (void)requestCodeDidFinishWithReciever:(SEAuthCodeReciever *)reciever {
    [self.view hideLoader];
    // Open confirm
}

- (void)requestCodeDidFailWithError:(NSError *)error {
    NSString *title = @"Не удалось отправить код".localized;
    NSString *message;
    if ([error.domain isEqualToString:SEErrorDomainApp]) {
        message = [SEError errorMessageForCode:error.code];
    } else {
        message = [SEError errorMessageForConnectionError];
    }
    [self.view hideLoader];
    [self.view showErrorWithTitle:title message:message];
}

@end
