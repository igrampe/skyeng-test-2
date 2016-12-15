//
//	SESignInView.m
//  SignIn
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 12/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import "SESignInView.h"
#import <PureLayout.h>

#import "SETextField.h"
#import "SEPrimaryButton.h"
#import "SESecondaryButton.h"

@interface SESignInView ()

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UILabel *headerLabel;
@property (nonatomic, strong) SETextField *emailField;
@property (nonatomic, strong) SEPrimaryButton *codeButton;
@property (nonatomic, strong) SESecondaryButton *passwordButton;
@property (nonatomic, strong) UILabel *hintLabel;

@end

@implementation SESignInView

- (void)setupView {
    [super setupView];
    self.title = @"Вход";
    self.view.backgroundColor = [THEME colorMainBackground];
    
    self.scrollView = [UIScrollView newAutoLayoutView];
    [self.view addSubview:self.scrollView];
    
    self.headerLabel = [UILabel newAutoLayoutView];
    self.headerLabel.numberOfLines = 0;
    self.headerLabel.font = [THEME primaryFontWithSize:15];
    self.headerLabel.textColor = [THEME colorText];
    self.headerLabel.text = @"Войдите под вашим аккаунтом в школе Skyeng и получите доступ к мобильному личному кабинету.";
    [self.scrollView addSubview:self.headerLabel];
    
    self.emailField = [SETextField newAutoLayoutView];
    self.emailField.placeholder = @"Электронная почта";
    [self.scrollView addSubview:self.emailField];
    
    self.codeButton = [SEPrimaryButton newAutoLayoutView];
    [self.codeButton setTitle:@"Получить код для входа" forState:UIControlStateNormal];
    [self.scrollView addSubview:self.codeButton];
    
    self.passwordButton = [SESecondaryButton newAutoLayoutView];
    [self.passwordButton setTitle:@"Обычный вход с паролем" forState:UIControlStateNormal];
    [self.scrollView addSubview:self.passwordButton];
    
    self.hintLabel = [UILabel newAutoLayoutView];
    self.hintLabel.font = [THEME primaryFontWithSize:13];
    self.hintLabel.textColor = [THEME colorHint];
    self.hintLabel.numberOfLines = 0;
    self.hintLabel.textAlignment = NSTextAlignmentCenter;
    self.hintLabel.text = @"Сложный пароль или не хотите искать — войдите по коду. Или используйте обычный вход.";
    [self.scrollView addSubview:self.hintLabel];
    
    [self.view relayout];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.output viewIsReady];
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

@end
