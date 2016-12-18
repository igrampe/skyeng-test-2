//
//  SESecondaryButton.m
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 15/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "SESecondaryButton.h"
#import "SEAppTheme.h"

@interface SESecondaryButton ()

@property (nonatomic, strong) UIColor *borderColorNormal;
@property (nonatomic, strong) UIColor *borderColorDisabled;

@end

@implementation SESecondaryButton

- (void)setupView {
    [super setupView];
    self.borderColorNormal = [THEME colorButtonSecondaryBorder];
    self.borderColorDisabled = [self.borderColorNormal colorWithAlphaComponent:0.5];
    
    self.layer.borderColor = self.borderColorNormal.CGColor;
    self.layer.borderWidth = 1;
    [self setTitleColor:[THEME colorButtonSecondaryTitle] forState:UIControlStateNormal];
    [self setTitleColor:[[THEME colorButtonSecondaryTitle] colorWithAlphaComponent:0.5] forState:UIControlStateDisabled];
    self.titleLabel.font = [THEME primaryFontWithSize:16];
}

- (void)setEnabled:(BOOL)enabled {
    [super setEnabled:enabled];
    self.layer.borderColor = enabled ? self.borderColorNormal.CGColor : self.borderColorDisabled.CGColor;
}

@end
