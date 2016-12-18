//
//	SEConfirmCodeInteractor.m
//  ConfirmCode
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 14/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import "SEConfirmCodeInteractor.h"
#import "SEConfirmCodeInteractorInput.h"

@interface SEConfirmCodeInteractor () <SEConfirmCodeInteractorInput>

@end

@implementation SEConfirmCodeInteractor

#pragma mark - SEConfirmCodeInteractorInput

- (SEAuthCodeReciever *)authCodeReciever {
    return [self.stateService authCodeReciever];
}

@end
