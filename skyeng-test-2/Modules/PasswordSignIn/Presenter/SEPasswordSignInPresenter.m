//
//	SEPasswordSignInPresenter.m
//  PasswordSignIn
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 18/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import "SEPasswordSignInPresenter.h"
#import "SEPasswordSignInViewOutput.h"
#import "SEPasswordSignInInteractorOutput.h"
#import "SEPasswordSignInModuleInput.h"
#import "SEPasswordSignInModuleOutput.h"

#import "NSString+EmailValidate.h"
#import "SEError.h"

@interface SEPasswordSignInPresenter ()
<SEPasswordSignInViewOutput,
SEPasswordSignInInteractorOutput,
SEPasswordSignInModuleInput>

@property (nonatomic, strong) NSArray *errorAlertOptions;

@end

@implementation SEPasswordSignInPresenter

@synthesize moduleOutput;

- (void)validateTextFields {
    NSString *passoword = [self.view valuePassword];
    NSString *email = [self.view valueEmail];
    BOOL enabled = email && [email isValidEmail] && (passoword.length > 0);
    [self.view setSignInButtonEnabled:enabled];
}

#pragma mark - SEPasswordSignInViewOutput

- (void)eventViewIsReady {
    [self.view setSignInButtonEnabled:NO];
}

- (void)eventEmailFieldTextDidChange:(NSString *)text {
    [self validateTextFields];
}

- (void)eventPasswordFieldTextDidChange:(NSString *)text {
    [self validateTextFields];
}

- (void)actionSignIn {
    NSString *passoword = [self.view valuePassword];
    NSString *email = [self.view valueEmail];
    if (email && [email isValidEmail] && (passoword.length > 1)) {
        [self.view showLoaderWithMessage:@"Выполняется вход".localized];        
        [self.interactor apiSignInWithEmail:email password:passoword];
    }
}

- (void)actionRequestCode {
    [(id<SEPasswordSignInModuleOutput>)self.moduleOutput passwordSignInModuleDidCancel];
}

- (void)actionErrorAlertItemWithIndex:(NSInteger)index {
    if (self.errorAlertOptions.count == 2 && index == 0) {
        [(id<SEPasswordSignInModuleOutput>)self.moduleOutput passwordSignInModuleDidCancel];
    }
}

#pragma mark - SEPasswordSignInInteractorOutput

- (void)signInDidFinishWithToken:(NSString *)token {
    [self.view showSuccessWithMessage:@"Вход выполнен".localized];
    [(id<SEPasswordSignInModuleOutput>)self.moduleOutput passwordSignInModuleDidFinish];
}

- (void)signInDidFailWithError:(NSError *)error {
    NSString *title = @"Войти не удалось".localized;
    NSString *message;
    NSMutableArray *options = [NSMutableArray new];
    if ([error.domain isEqualToString:SEErrorDomainApp]) {
        message = [SEError errorMessageForCode:error.code];
        if (error.code == SEErrorCodeIncorrectEmailOrPassword) {
            [options addObject:@"Войти без пароля".localized];
        }
    } else {
        message = [SEError errorMessageForConnectionError];
    }
    [options addObject:@"Попробовать снова".localized];
    self.errorAlertOptions = options;
    [self.view hideLoader];
    [self.view showErrorWithTitle:title message:message options:self.errorAlertOptions];
}

@end
