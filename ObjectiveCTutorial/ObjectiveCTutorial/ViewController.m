//
//  ViewController.m
//  ObjectiveCTutorial
//
//  Created by mcs on 10/24/19.
//  Copyright © 2019 EricOusouphan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  [[[NSURLSession.sharedSession dataTaskWithURL:NSURL alloc]
    initwithString: @"www.google.com"] completionHandler:^(NSData * _Nullable data, NSURLResponse *_Nullable response, NSError *_Nullable error){
    id jsonObject = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error: (NSError *__autoreleasing)];
    if (data) {
      
    }
  }]
  
  
}


@end
