//
//  SEAppAssembly.m
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 11/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "SEAppAssembly.h"
#import "AppDelegate.h"

@implementation SEAppAssembly

- (AppDelegate *)appDelegate {
    return [TyphoonDefinition withClass:[AppDelegate class]
                          configuration:
            ^(TyphoonDefinition *definition) {
                [definition injectProperty:@selector(window) with:self.mainWindow];
                [definition injectProperty:@selector(rootViewController) with:self.rootAssembly.viewRoot];
            }];
}

- (UIWindow *)mainWindow {
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    return window;
}

@end
