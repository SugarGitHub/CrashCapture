//
//  AppDelegate.m
//  CrashCapture
//
//  Created by suhengxian on 16/1/26.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "AppDelegate.h"
#import "CrashViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window=[[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController=[[CrashViewController alloc] init];
    [self.window makeKeyAndVisible];
    
    NSSetUncaughtExceptionHandler(&captureException);
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark --捕获异常
void captureException(NSException *exception){
    NSArray *stackArr = [exception callStackSymbols];
    NSString *reasonStr = [exception reason];
    NSString *nameStr = [exception name];
    NSString *exceptionInfo = [NSString stringWithFormat:@"Exception reason：%@\nException name：%@\nException stack：%@",nameStr, reasonStr, stackArr];
    NSMutableArray *carshArr = [NSMutableArray arrayWithArray:stackArr];
    [carshArr insertObject:reasonStr atIndex:0];
    //保存到本地
    [exceptionInfo writeToFile:ERRORPATH atomically:YES encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"崩溃日志路径:%@",ERRORPATH);
    
    //然后上传到服务器.............
}

@end
