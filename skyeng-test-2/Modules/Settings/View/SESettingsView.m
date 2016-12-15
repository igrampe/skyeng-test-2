//
//	SESettingsView.m
//  Settings
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 14/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import "SESettingsView.h"
#import <PureLayout.h>

@interface SESettingsView ()

@property (nonatomic, strong) UIButton *logoutButton;

@end

@implementation SESettingsView

- (void)setupView {
    [super setupView];
    self.view.backgroundColor = [UIColor blueColor];
    self.logoutButton = [UIButton newAutoLayoutView];
    [self.logoutButton addTarget:self.output
                          action:@selector(actionLogout)
                forControlEvents:UIControlEventTouchUpInside];
    [self.logoutButton setTitle:@"Logout" forState:UIControlStateNormal];
    [self.logoutButton setTintColor:[UIColor blackColor]];
    self.logoutButton.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.logoutButton];
    
    [self.view setNeedsUpdateConstraints];
    [self.view setNeedsLayout];
    [self.view layoutIfNeeded];
}

- (void)updateViewConstraints {
    [super updateViewConstraints];
    if (self.didSetupConstraints) {
        return;
    }
    
    [self.logoutButton autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [self.logoutButton autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [self.logoutButton autoSetDimension:ALDimensionHeight toSize:44];
}

@end
