//
//  SEPrimaryButton.m
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 15/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "SEPrimaryButton.h"
#import "SEAppTheme.h"

@interface SEPrimaryButton ()

@property (nonatomic, strong) UIColor *backgroundColorNormal;
@property (nonatomic, strong) UIColor *backgroundColorDisabled;

@end

@implementation SEPrimaryButton

- (void)setupView {
    [super setupView];
    self.backgroundColorNormal = [THEME colorButtonPrimaryBackgroundNormal];
    self.backgroundColorDisabled = [THEME colorButtonPrimaryBackgroundDisabled];
    self.backgroundColor = self.backgroundColorNormal;
    [self setTitleColor:[THEME colorButtonPrimaryTitle] forState:UIControlStateNormal];
    self.titleLabel.font = [THEME primaryFontWithSize:18];
}

- (void)setEnabled:(BOOL)enabled {
    [super setEnabled:enabled];
    self.backgroundColor = enabled ? self.backgroundColorNormal : self.backgroundColorDisabled;
}

@end
