//
//  AppDelegate.m
//  BottomBarViewDemo
//
//  Created by ug on 2020/6/19.
//  Copyright © 2020 yy. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
     self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        self.window.backgroundColor = [UIColor whiteColor];

    
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    UIViewController *myView = [story instantiateViewControllerWithIdentifier:@"ViewController"];   
        self.window.rootViewController = myView;
        
        [self.window makeKeyAndVisible];
        return YES;

}





@end
