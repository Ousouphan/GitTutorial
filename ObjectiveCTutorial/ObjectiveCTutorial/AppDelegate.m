//
//  AppDelegate.m
//  ObjectiveCTutorial
//
//  Created by mcs on 10/24/19.
//  Copyright © 2019 EricOusouphan. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h" //must call it to access stuff in file

@interface AppDelegate ()

@end

@implementation AppDelegate

// - instance must be there
// + calling instance
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  // Override point for customization after application launch.
  ViewController *theVC = [ViewController new]; //easier way to call
//  ViewController *theVC = [[ViewController alloc] init];
  //* is a pointer to object
  //[[]] to call view controller, alloc to allow memory
//  theVC.name; how to call data
  theVC.name = @"Cool VC Name";
  NSLog(@"theVC name is %@", theVC.name);
  //  NSLog(@"Hello World"); how to print
  return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
  // Called when a new scene session is being created.
  // Use this method to select a configuration to create the new scene with.
  return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
  // Called when the user discards a scene session.
  // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
  // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
