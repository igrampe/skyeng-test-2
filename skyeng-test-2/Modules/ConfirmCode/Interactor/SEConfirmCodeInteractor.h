//
//	SEConfirmCodeInteractor.h
//  ConfirmCode
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 14/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "SEConfirmCodeInteractorOutput.h"

@interface SEConfirmCodeInteractor : NSObject

@property (nonatomic, weak) id<SEConfirmCodeInteractorOutput> output;

@end
