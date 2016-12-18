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

#import "SEConfirmCodeModuleOutput.h"
#import "SEPasswordSignInModuleOutput.h"

#import "NSString+EmailValidate.h"
#import "SEError.h"

@interface SESignInPresenter ()
<SESignInViewOutput,
SESignInInteractorOutput,
SESignInModuleInput,
SEConfirmCodeModuleOutput,
SEPasswordSignInModuleOutput>

@end

@implementation SESignInPresenter

@synthesize moduleOutput;

#pragma mark - SESignInViewOutput

- (void)viewIsReady {
    [self.view setCodeButtonEnabled:NO];
}

- (void)eventEmailFieldTextDidChange:(NSString *)text {
    [self.view setCodeButtonEnabled:(text && [text isValidEmail])];
}

- (void)actionCode {
    NSString *email = [self.view valueEmail];
    if ((email && [email isValidEmail])) {
        [self.view showLoaderWithMessage:@"Отправка кода...".localized];
        [self.interactor apiRequestCodeForEmail:email];
    }
}

- (void)actionPassword {
    [self.router openPasswordSignInModule];
}

#pragma mark - SESignInInteractorOutput

- (void)requestCodeDidFinishWithReciever:(SEAuthCodeReciever *)reciever {
    [self.view hideLoader];
    [self.router openConfirmCodeModule];
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

#pragma mark - SEConfirmCodeModuleOutput

- (void)confirmCodeModuleDidFinish {
    [(id<SESignInModuleOutput>)self.moduleOutput signInModuleDidFinish];
}

#pragma mark - SEPasswordSignInModuleOutput

- (void)passwordSignInModuleDidFinish {
    [(id<SESignInModuleOutput>)self.moduleOutput signInModuleDidFinish];
}

- (void)passwordSignInModuleDidCancel {
    [self.router closePasswordSignInModule];
}

@end
