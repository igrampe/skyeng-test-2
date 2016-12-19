//
//	SESignInView.m
//  SignIn
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 12/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import "SESignInView.h"
#import "SESignInViewInput.h"

#import <PureLayout.h>
#import <SVProgressHUD.h>

#import "SETextField.h"
#import "SEPrimaryButton.h"
#import "SESecondaryButton.h"

#import "APLKeyboardHelper.h"


@interface SESignInView () <UITextFieldDelegate, SESignInViewInput>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UILabel *headerLabel;
@property (nonatomic, strong) SETextField *emailField;
@property (nonatomic, strong) SEPrimaryButton *codeButton;
@property (nonatomic, strong) SESecondaryButton *passwordButton;
@property (nonatomic, strong) UILabel *hintLabel;

@end

@implementation SESignInView

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)setupView {
    [super setupView];
    self.title = @"Вход".localized;
    self.view.backgroundColor = [THEME colorMainBackground];
    
    self.scrollView = [UIScrollView newAutoLayoutView];
    [self.view addSubview:self.scrollView];
    
    self.headerLabel = [UILabel newAutoLayoutView];
    self.headerLabel.numberOfLines = 0;
    self.headerLabel.font = [THEME primaryFontWithSize:15];
    self.headerLabel.textColor = [THEME colorText];
    self.headerLabel.text = @"Войдите под вашим аккаунтом в школе Skyeng и получите доступ к мобильному личному кабинету.".localized;
    [self.scrollView addSubview:self.headerLabel];
    
    self.emailField = [SETextField newAutoLayoutView];
    self.emailField.placeholder = @"Электронная почта".localized;
    self.emailField.keyboardType = UIKeyboardTypeEmailAddress;
    [self.scrollView addSubview:self.emailField];
    
    self.codeButton = [SEPrimaryButton newAutoLayoutView];
    [self.codeButton setTitle:@"Получить код для входа".localized forState:UIControlStateNormal];
    [self.codeButton addTarget:self.output
                        action:@selector(actionCode)
              forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:self.codeButton];
    
    self.passwordButton = [SESecondaryButton newAutoLayoutView];
    [self.passwordButton setTitle:@"Обычный вход с паролем".localized forState:UIControlStateNormal];
    [self.passwordButton addTarget:self.output
                        action:@selector(actionPassword)
              forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:self.passwordButton];
    
    self.hintLabel = [UILabel newAutoLayoutView];
    self.hintLabel.font = [THEME primaryFontWithSize:13];
    self.hintLabel.textColor = [THEME colorHint];
    self.hintLabel.numberOfLines = 0;
    self.hintLabel.textAlignment = NSTextAlignmentCenter;
    self.hintLabel.text = @"Сложный пароль или не хотите искать — войдите по коду. Или используйте обычный вход.".localized;
    [self.scrollView addSubview:self.hintLabel];
    
    [self.view relayout];
    
    __weak typeof(self) welf = self;
    [welf handleKeyboardWillShow:^(CGSize keyboardSize, double duration) {
        self.scrollView.contentInset = UIEdgeInsetsMake(welf.scrollView.contentInset.top,
                                                        welf.scrollView.contentInset.left,
                                                        keyboardSize.height,
                                                        welf.scrollView.contentInset.right);
    }];
    [welf handleKeyboardWillHide:^(CGSize keyboardSize, double duration) {
        welf.scrollView.contentInset = UIEdgeInsetsMake(welf.scrollView.contentInset.top,
                                                        welf.scrollView.contentInset.left,
                                                        0,
                                                        welf.scrollView.contentInset.right);
    }];
    [welf handleKeyboardWillChange:^(CGSize keyboardSize, double duration) {
        welf.scrollView.contentInset = UIEdgeInsetsMake(welf.scrollView.contentInset.top,
                                                        welf.scrollView.contentInset.left,
                                                        keyboardSize.height,
                                                        welf.scrollView.contentInset.right);
    }];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(textFieldTextDidChange:)
                                                 name:UITextFieldTextDidChangeNotification
                                               object:nil];
    
    [self.output viewIsReady];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)updateViewConstraints {
    [super updateViewConstraints];
    if (self.didSetupConstraints) {
        return;
    }
    
    [self.scrollView autoPinEdgesToSuperviewEdges];
    
    [self.headerLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:23];
    [self.headerLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:16];
    [self.headerLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:16];
    
    [self.emailField autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [self.emailField autoPinEdgeToSuperviewEdge:ALEdgeRight];
    [self.emailField autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.headerLabel withOffset:28];
    [self.emailField autoSetDimension:ALDimensionHeight toSize:48];
    [self.emailField autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:self.view];
    
    [self.codeButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:16];
    [self.codeButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:16];
    [self.codeButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.emailField withOffset:24];
    [self.codeButton autoSetDimension:ALDimensionHeight toSize:48];
    
    [self.passwordButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:16];
    [self.passwordButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:16];
    [self.passwordButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.codeButton withOffset:16];
    [self.passwordButton autoSetDimension:ALDimensionHeight toSize:36];
    
    [self.hintLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:16];
    [self.hintLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:16];
    [self.hintLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.passwordButton withOffset:16];
    [self.hintLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:16];
}

#pragma mark - SESignInViewInput

#pragma mark -- Configure

- (void)setCodeButtonEnabled:(BOOL)enabled {
    if (self.codeButton.enabled != enabled) {
        self.codeButton.enabled = enabled;
    }
}

#pragma mark -- Getters

- (NSString *)valueEmail {
    return self.emailField.text;
}

#pragma mark -- Actions

- (void)showLoaderWithMessage:(NSString *)message {
    [SVProgressHUD showWithStatus:message];
}

- (void)hideLoader {
    [SVProgressHUD popActivity];
}

- (void)showErrorWithTitle:(NSString *)title message:(NSString *)message {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"Попробовать снова".localized
                                                     style:UIAlertActionStyleDefault
                                                   handler:nil];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - Notifications

- (void)textFieldTextDidChange:(NSNotification *)notification {
    UITextField *textField = [notification object];
    if (textField == self.emailField) {
        [self.output eventEmailFieldTextDidChange:self.emailField.text];
    }
}

@end
