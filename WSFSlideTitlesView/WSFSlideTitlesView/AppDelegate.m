//
//  AppDelegate.m
//  WSFSlideTitlesView
//
//  Created by WangShengFeng on 3/7/16.
//  Copyright © 2016 WangShengFeng. All rights reserved.
//

#import "AppDelegate.h"
#import "WSFSlideTitlesViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (UIWindow *)window
{
    if (!_window) {
        _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        [_window makeKeyAndVisible];
    }
    return _window;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    WSFSlideTitlesViewController *slideVC = [[WSFSlideTitlesViewController alloc] init];
    slideVC.title = @"WSFSlideTitlesView";
    slideVC.view.backgroundColor = [UIColor orangeColor];
    
    UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:slideVC];
    
    self.window.rootViewController = navVC;
    
    return YES;
}

@end
