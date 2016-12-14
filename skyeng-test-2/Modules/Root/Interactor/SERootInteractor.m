//
//  SERootInteractor.m
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 11/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "SERootInteractor.h"
#import "SERootInteractorInput.h"

@interface SERootInteractor () <SERootInteractorInput>

@end

@implementation SERootInteractor

#pragma mark - SERootInteractorInput

- (BOOL)isAuthorized {
    return [self.stateService isAuthorized];
}

@end
