//
//  SESecondaryButton.m
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 15/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "SESecondaryButton.h"
#import "SEAppTheme.h"

@implementation SESecondaryButton

- (void)setupView {
    [super setupView];
    self.layer.borderColor = [THEME colorButtonSecondaryBorder].CGColor;
    self.layer.borderWidth = 1;
    [self setTitleColor:[THEME colorButtonSecondaryTitle] forState:UIControlStateNormal];
    self.titleLabel.font = [THEME primaryFontWithSize:16];
}

@end
