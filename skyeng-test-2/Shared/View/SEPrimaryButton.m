//
//  SEPrimaryButton.m
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 15/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "SEPrimaryButton.h"
#import "SEAppTheme.h"

@implementation SEPrimaryButton

- (void)setupView {
    [super setupView];
    self.backgroundColor = [THEME colorButtonPrimaryBackground];
    [self setTitleColor:[THEME colorButtonPrimaryTitle] forState:UIControlStateNormal];
    self.titleLabel.font = [THEME primaryFontWithSize:18];
}

@end
