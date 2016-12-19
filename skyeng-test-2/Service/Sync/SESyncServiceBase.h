//
//  SESyncServiceBase.h
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 12/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SESyncService.h"
#import "SEApiService.h"

@interface SESyncServiceBase : NSObject <SESyncService>

@property (nonatomic, weak) id<SEApiService> apiService;

@end
