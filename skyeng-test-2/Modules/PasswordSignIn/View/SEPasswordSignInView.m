//
//	SEPasswordSignInView.m
//  PasswordSignIn
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 18/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import "SEPasswordSignInView.h"
#import "SEPasswordSignInViewInput.h"

#import <PureLayout.h>
#import <SVProgressHUD.h>

#import "SETextField.h"
#import "SEPrimaryButton.h"
#import "SESecondaryButton.h"
#import "SEAlertAction.h"

#import "APLKeyboardHelper.h"

@interface SEPasswordSignInView () <SEPasswordSignInViewInput>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UILabel *headerLabel;
@property (nonatomic, strong) SETextField *emailField;
@property (nonatomic, strong) SETextField *passwordField;
@property (nonatomic, strong) SEPrimaryButton *singInButton;
@property (nonatomic, strong) SESecondaryButton *codeButton;
@property (nonatomic, strong) UILabel *hintLabel;

@end

@implementation SEPasswordSignInView

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
    
    self.passwordField = [SETextField newAutoLayoutView];
    self.passwordField.secureTextEntry = YES;
    self.passwordField.placeholder = @"Пароль".localized;
    self.passwordField.keyboardType = UIKeyboardTypeEmailAddress;
    [self.scrollView addSubview:self.passwordField];
    
    self.singInButton = [SEPrimaryButton newAutoLayoutView];
    [self.singInButton setTitle:@"Войти".localized forState:UIControlStateNormal];
    [self.singInButton addTarget:self.output
                        action:@selector(actionSignIn)
              forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:self.singInButton];
    
    self.codeButton = [SESecondaryButton newAutoLayoutView];
    [self.codeButton setTitle:@"Войти без пароля".localized forState:UIControlStateNormal];
    [self.codeButton addTarget:self.output
                            action:@selector(actionRequestCode)
                  forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:self.codeButton];
    
    self.hintLabel = [UILabel newAutoLayoutView];
    self.hintLabel.font = [THEME primaryFontWithSize:13];
    self.hintLabel.textColor = [THEME colorHint];
    self.hintLabel.numberOfLines = 0;
    self.hintLabel.textAlignment = NSTextAlignmentCenter;
    self.hintLabel.text = @"Сложный пароль или не хотите искать — используйте вход без пароля.".localized;
    [self.scrollView addSubview:self.hintLabel];
    
    [self.view relayout];
    
    [self handleKeyboardWillShow:^(CGSize keyboardSize, double duration) {
        self.scrollView.contentInset = UIEdgeInsetsMake(self.scrollView.contentInset.top,
                                                        self.scrollView.contentInset.left,
                                                        keyboardSize.height,
                                                        self.scrollView.contentInset.right);
    }];
    [self handleKeyboardWillHide:^(CGSize keyboardSize, double duration) {
        self.scrollView.contentInset = UIEdgeInsetsMake(self.scrollView.contentInset.top,
                                                        self.scrollView.contentInset.left,
                                                        0,
                                                        self.scrollView.contentInset.right);
    }];
    [self handleKeyboardWillChange:^(CGSize keyboardSize, double duration) {
        self.scrollView.contentInset = UIEdgeInsetsMake(self.scrollView.contentInset.top,
                                                        self.scrollView.contentInset.left,
                                                        keyboardSize.height,
                                                        self.scrollView.contentInset.right);
    }];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(textFieldTextDidChange:)
                                                 name:UITextFieldTextDidChangeNotification
                                               object:nil];
    
    [self.output eventViewIsReady];
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
    
    [self.passwordField autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [self.passwordField autoPinEdgeToSuperviewEdge:ALEdgeRight];
    [self.passwordField autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.emailField withOffset:2];
    [self.passwordField autoSetDimension:ALDimensionHeight toSize:48];
    [self.passwordField autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:self.emailField];
    
    [self.singInButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:16];
    [self.singInButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:16];
    [self.singInButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.passwordField withOffset:24];
    [self.singInButton autoSetDimension:ALDimensionHeight toSize:48];
    
    [self.codeButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:16];
    [self.codeButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:16];
    [self.codeButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.singInButton withOffset:16];
    [self.codeButton autoSetDimension:ALDimensionHeight toSize:36];
    
    [self.hintLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:16];
    [self.hintLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:16];
    [self.hintLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.codeButton withOffset:16];
    [self.hintLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:16];
}

#pragma mark - SEPasswordSignInViewInput

#pragma mark -- Configure

- (void)setSignInButtonEnabled:(BOOL)enabled {
    if (self.singInButton.enabled != enabled) {
        self.singInButton.enabled = enabled;
    }
}

#pragma mark -- Getters

- (NSString *)valueEmail {
    return self.emailField.text;
}

- (NSString *)valuePassword {
    return self.passwordField.text;
}

#pragma mark -- Actions

- (void)showLoaderWithMessage:(NSString *)message {
    [SVProgressHUD showWithStatus:message];
}

- (void)hideLoader {
    [SVProgressHUD popActivity];
}

- (void)showErrorWithTitle:(NSString *)title message:(NSString *)message options:(NSArray *)options {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    for (NSInteger i = 0; i < options.count; i++) {
        NSString *option = options[i];
        SEAlertAction *action = [SEAlertAction actionWithTitle:option
                                                         style:UIAlertActionStyleDefault
                                                       handler:
        ^(UIAlertAction *action) {
            if ([action isKindOfClass:[SEAlertAction class]]) {
                [self.output actionErrorAlertItemWithIndex:((SEAlertAction *)action).index];
            }
        }];
        action.index = i;
        [alert addAction:action];
    }
    [self.navigationController presentViewController:alert animated:YES completion:nil];
}

- (void)showSuccessWithMessage:(NSString *)message {
    [SVProgressHUD showSuccessWithStatus:message];
}

#pragma mark - Notifications

- (void)textFieldTextDidChange:(NSNotification *)notification {
    UITextField *textField = [notification object];
    if (textField == self.emailField) {
        [self.output eventEmailFieldTextDidChange:self.emailField.text];
    } else if (textField == self.passwordField) {
        [self.output eventPasswordFieldTextDidChange:self.passwordField.text];
    }
}

@end
