//
//  AppDelegate.m
//  Car4S
//
//  Created by Alta on 16/5/24.
//  Copyright © 2016年 beyondsoft. All rights reserved.
//

#import "AppDelegate.h"
#import "HomePageViewController.h"
#import "CustomerViewController.h"
#import "ReportFormsViewController.h"
#import "MineViewController.h"
#import "FontAndColorDefines.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self creatRootViewController];
    [self.window makeKeyAndVisible];
    application.applicationIconBadgeNumber = 5;
    // Override point for customization after application launch.
    return YES;
}

- (UINavigationController*)creatViewController:(id)viewController title:(NSString *)title {
    UINavigationController *homeNav = [[UINavigationController alloc]initWithRootViewController:viewController];
    homeNav.title = title;
    [homeNav.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    homeNav.navigationBar.barTintColor = kColor_orange;
    return homeNav;
}

- (void)creatRootViewController {
    //首页
    HomePageViewController *homePageVC = [[HomePageViewController alloc]init];
    UINavigationController *homeNav = [self creatViewController:homePageVC title:@"首页"];

    //客户
    CustomerViewController *customerVC = [[CustomerViewController alloc]init];
    UINavigationController *customerNav = [self creatViewController:customerVC title:@"客户"];
    
    //报表
    ReportFormsViewController *reportFormsVC = [[ReportFormsViewController alloc]init];
    UINavigationController *reportFormsNav = [self creatViewController:reportFormsVC title:@"报表"];

    //我的
    MineViewController *mineVC = [[MineViewController alloc]init];
    UINavigationController *mineNav = [self creatViewController:mineVC title:@"我的"];

    
    UITabBarController *tabBarVC = [[UITabBarController alloc]init];
    tabBarVC.view.backgroundColor = [UIColor whiteColor];
    tabBarVC.tabBar.tintColor = kColor_orange;
    //tabBarVC.tabBar.barTintColor = kColor_orange;
    tabBarVC.viewControllers = @[homeNav,customerNav,reportFormsNav,mineNav];
    
    NSArray *selectedImages = @[@"tab_home_normal", @"tab_customer_normal", @"tab_reportForms_normal", @"tab_mine_normal"];;
    NSArray *unSelectedImages = @[@"tab_home_normal", @"tab_customer_normal", @"tab_reportForms_normal", @"tab_mine_normal"];
    for (NSUInteger index = 0; index<selectedImages.count; index++) {
        UITabBarItem *item = [tabBarVC.tabBar.items objectAtIndex:index];
        //[[UIImage imageNamed:selectedImgs[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]; 原图
        item.selectedImage = [UIImage imageNamed:selectedImages[index]];
        item.image = [UIImage imageNamed:unSelectedImages[index]];
    }
    self.window.rootViewController = tabBarVC;
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

@end
