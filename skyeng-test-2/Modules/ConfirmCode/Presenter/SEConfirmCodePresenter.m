//
//	SEConfirmCodePresenter.m
//  ConfirmCode
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 14/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import "SEConfirmCodePresenter.h"
#import "SEConfirmCodeViewOutput.h"
#import "SEConfirmCodeInteractorOutput.h"
#import "SEConfirmCodeModuleInput.h"
#import "SEConfirmCodeModuleOutput.h"

#import "SEAuthCodeReciever.h"
#import "SEError.h"

@interface SEConfirmCodePresenter ()
<SEConfirmCodeViewOutput,
SEConfirmCodeInteractorOutput,
SEConfirmCodeModuleInput>

@property (nonatomic, strong) NSTimer *codeTimer;
@property (nonatomic, assign) NSInteger timeLeft;

@end

@implementation SEConfirmCodePresenter

@synthesize moduleOutput;

#pragma mark - SEConfirmCodeViewOutput

- (void)startCodeTimer {
    self.timeLeft = 5;
    [self updateUICodeButton];
    self.codeTimer = [NSTimer scheduledTimerWithTimeInterval:1
                                                     repeats:YES
                                                       block:
    ^(NSTimer *timer) {
        [self updateUICodeButton];
    }];
}

- (void)updateUICodeButton {
    self.timeLeft--;
    NSString *text = @"Выслать код повторно".localized;
    if (self.timeLeft > 0) {
        NSInteger minutes = self.timeLeft / 60;
        NSInteger seconds = self.timeLeft - minutes*60;
        text = [NSString stringWithFormat:@"%@ (%ld:%02ld)", text, minutes, seconds];
    }
    [self.view setCodeButtonTitle:text];
    [self.view setCodeButtonEnabled:(self.timeLeft <= 0)];
    if (self.timeLeft < 0) {
        [self.codeTimer invalidate];
    }
}

- (void)updateUIHeaderText {
    SEAuthCodeReciever *reciever = [self.interactor authCodeReciever];
    NSString *recieverTypeText = @"";
    switch (reciever.type) {
        case SEAuthCodeRecieverTypePhone:
            recieverTypeText = @"телефон".localized;
            break;
        case SEAuthCodeRecieverTypeEmail:
            recieverTypeText = @"почту".localized;
        default:
            break;
    }
    NSString *headerText = [NSString stringWithFormat:@"%@ %@ %@)",
                            @"Введите код (отправлен на".localized,
                            recieverTypeText,
                            reciever.value];
    [self.view setHeaderText:headerText];
}

#pragma mark -- Events

- (void)eventViewIsReady {
    [self updateUIHeaderText];
    [self startCodeTimer];
    [self.view setSignInButtonEnabled:NO];
}

- (void)eventCodeFieldTextDidChange:(NSString *)text {
    [self.view setSignInButtonEnabled:(text.length > 3)];
}

#pragma mark -- Actions

- (void)actionSignIn {
    NSString *code = [self.view valueCode];
    if (code.length > 3) {
        [self.view showLoaderWithMessage:@"Выполняется вход...".localized];
        [self.interactor signInWithAuthCode:code];
    }
}

- (void)actionRequestCode {
    [self.view showLoaderWithMessage:@"Отправка кода...".localized];
    [self.interactor requestCode];
}

#pragma mark - SEConfirmCodeInteractorOutput

- (void)requestCodeDidFinishWithReciever:(SEAuthCodeReciever *)reciever {
    [self updateUIHeaderText];
    [self.view hideLoader];
    [self.view setCodeButtonEnabled:NO];
    [self startCodeTimer];
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

- (void)signInDidFinishWithToken:(NSString *)token {
    [self.view showSuccessWithMessage:@"Вход выполнен".localized];
    [(id <SEConfirmCodeModuleOutput>)self.moduleOutput confirmCodeModuleDidFinish];
}

- (void)signInDidFailWithError:(NSError *)error {
    NSString *title = @"Войти не удалось".localized;
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
