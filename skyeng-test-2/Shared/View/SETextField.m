//
//  SETextField.m
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 15/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "SETextField.h"
#import "SEAppTheme.h"

@implementation SETextField

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)setupView {
    self.backgroundColor = [THEME colorTextFieldBackground];
    self.textColor = [THEME colorTextFieldTitle];
    self.font = [THEME primaryFontWithSize:16];
    
    UIView *leftPadding = [UIView new];
    leftPadding.frame = CGRectMake(0, 0, 16, 1);
    self.leftView = leftPadding;
    self.leftViewMode = UITextFieldViewModeAlways;
    
    UIView *rightPadding = [UIView new];
    rightPadding.frame = CGRectMake(0, 0, 16, 1);
    self.rightView = rightPadding;
    self.rightViewMode = UITextFieldViewModeAlways;
}

@end
