//
//  SERootPresenter.m
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 11/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "SERootPresenter.h"
#import "SERootViewOutput.h"
#import "SERootInteractorOutput.h"

@interface SERootPresenter () <SERootViewOutput, SERootInteractorOutput>

@end

@implementation SERootPresenter

#pragma mark - SERootViewOutput

- (void)viewIsReady {
    [self.router openSignInModule];
}

@end
