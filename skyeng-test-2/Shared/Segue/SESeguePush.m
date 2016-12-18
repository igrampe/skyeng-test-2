//
//  SESeguePush.m
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 18/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "SESeguePush.h"

@implementation SESeguePush

- (void)perform {    
    [[self navigationController] pushViewController:self.destination animated:YES];
}

- (void)unwind {
    [[self navigationController] popViewControllerAnimated:YES];
}

- (UINavigationController *)navigationController {
    UINavigationController *navCtl = self.source.navigationController;
    if ([self.source isKindOfClass:[UINavigationController class]]) {
        navCtl = (UINavigationController *)self.source;
    }
    return navCtl;
}

@end
