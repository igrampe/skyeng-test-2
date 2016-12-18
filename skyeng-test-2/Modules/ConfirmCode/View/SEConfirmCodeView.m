//
//	SEConfirmCodeView.m
//  ConfirmCode
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 14/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import "SEConfirmCodeView.h"
#import "SEConfirmCodeViewInput.h"

#import <PureLayout.h>

#import "APLKeyboardHelper.h"

#import "SEPrimaryButton.h"
#import "SESecondaryButton.h"
#import "SETextField.h"

@interface SEConfirmCodeView () <SEConfirmCodeViewInput>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UILabel *headerLabel;
@property (nonatomic, strong) SETextField *codeField;
@property (nonatomic, strong) SEPrimaryButton *signInButton;
@property (nonatomic, strong) SESecondaryButton *codeButton;

@end

@implementation SEConfirmCodeView

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)setupView {
    [super setupView];
    self.title = @"Вход по коду".localized;
    self.view.backgroundColor = [THEME colorMainBackground];
    
    self.scrollView = [UIScrollView newAutoLayoutView];
    [self.view addSubview:self.scrollView];
    
    self.headerLabel = [UILabel newAutoLayoutView];
    self.headerLabel.numberOfLines = 0;
    self.headerLabel.font = [THEME primaryFontWithSize:15];
    self.headerLabel.textColor = [THEME colorText];
    [self.scrollView addSubview:self.headerLabel];
    
    self.codeField = [SETextField newAutoLayoutView];
    self.codeField.placeholder = @"Код".localized;
    self.codeField.keyboardType = UIKeyboardTypeNumberPad;
    [self.scrollView addSubview:self.codeField];
    
    self.signInButton = [SEPrimaryButton newAutoLayoutView];
    [self.signInButton setTitle:@"Войти".localized forState:UIControlStateNormal];
    [self.signInButton addTarget:self.output
                          action:@selector(actionSignIn)
                forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:self.signInButton];
    
    self.codeButton = [SESecondaryButton newAutoLayoutView];
    [self.codeButton addTarget:self.output
                        action:@selector(actionRequestCode)
              forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:self.codeButton];
    
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

- (void)updateViewConstraints {
    [super updateViewConstraints];
    if (self.didSetupConstraints) {
        return;
    }
    
    [self.scrollView autoPinEdgesToSuperviewEdges];
    
    [self.headerLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:23];
    [self.headerLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:16];
    [self.headerLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:16];
    
    [self.codeField autoPinEdgeToSuperviewEdge:ALEdgeLeft];
    [self.codeField autoPinEdgeToSuperviewEdge:ALEdgeRight];
    [self.codeField autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.headerLabel withOffset:28];
    [self.codeField autoSetDimension:ALDimensionHeight toSize:48];
    [self.codeField autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:self.view];
    
    [self.signInButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:16];
    [self.signInButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:16];
    [self.signInButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.codeField withOffset:24];
    [self.signInButton autoSetDimension:ALDimensionHeight toSize:48];
    
    [self.codeButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:16];
    [self.codeButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:16];
    [self.codeButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.signInButton withOffset:16];
    [self.codeButton autoSetDimension:ALDimensionHeight toSize:36];
    [self.codeButton autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:16];
}

#pragma mark - SEConfirmCodeViewInput

- (void)setHeaderText:(NSString *)headerText {
    self.headerLabel.text = headerText;
}

- (void)setCodeButtonTitle:(NSString *)title {
    [self.codeButton setTitle:title forState:UIControlStateNormal];
}

- (void)setSignInButtonEnabled:(BOOL)enabled {
    self.signInButton.enabled = enabled;
}

- (void)setCodeButtonEnabled:(BOOL)enabled {
    self.codeButton.enabled = enabled;
}

#pragma mark - Notifications

- (void)textFieldTextDidChange:(NSNotification *)notification {
    UITextField *textField = [notification object];
    if (textField == self.codeField) {
        [self.output eventCodeFieldTextDidChange:self.codeField.text];
    }
}

@end
