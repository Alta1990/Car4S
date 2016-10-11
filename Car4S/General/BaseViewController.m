//
//  ViewController.m
//  Car4S
//
//  Created by Alta on 16/5/24.
//  Copyright © 2016年 beyondsoft. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)creatLeftButtonItemWithImage:(UIImage *)image selector:(SEL)selector {
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:selector];
}

- (void)creatRightButtonItemWithImage:(UIImage *)image selector:(SEL)selector{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:selector];
}
@end
