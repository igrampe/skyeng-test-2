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

#import "SEAuthCodeReciever.h"

@interface SEConfirmCodePresenter () <SEConfirmCodeViewOutput, SEConfirmCodeInteractorOutput>

@property (nonatomic, strong) NSTimer *codeTimer;
@property (nonatomic, assign) NSInteger timeLeft;

@end

@implementation SEConfirmCodePresenter

#pragma mark - SEConfirmCodeViewOutput

- (void)startCodeTimer {
    self.timeLeft = 300;
    [self updateCodeButton];
    self.codeTimer = [NSTimer scheduledTimerWithTimeInterval:1
                                                     repeats:YES
                                                       block:
    ^(NSTimer *timer) {
        [self updateCodeButton];
    }];
}

- (void)updateCodeButton {
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

#pragma mark -- Events

- (void)eventViewIsReady {
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
    [self.view setSignInButtonEnabled:NO];
    [self startCodeTimer];
    [self.view setCodeButtonEnabled:NO];
}

- (void)eventCodeFieldTextDidChange:(NSString *)text {
    [self.view setSignInButtonEnabled:(text.length > 3)];
}

#pragma mark -- Actions

- (void)actionSignIn {
    
}

- (void)actionRequestCode {
    
}

@end
