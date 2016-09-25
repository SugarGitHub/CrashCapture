//
//  CrashViewController.m
//  CrashCapture
//
//  Created by suhengxian on 16/1/26.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "CrashViewController.h"

@interface CrashViewController ()

@end

@implementation CrashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self test];
}

- (void)test{
    UILabel * lb = [[UILabel alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height)];
    lb.backgroundColor=[UIColor yellowColor];
    lb.textAlignment = NSTextAlignmentCenter;
    lb.textColor = [UIColor blackColor];
    lb.font =[UIFont systemFontOfSize:15];
    lb.numberOfLines=0;
    lb.text = [NSString stringWithFormat:@"5秒后崩溃，崩溃日志已保存到:%@",ERRORPATH];
    [self.view addSubview:lb];
    [self performSelector:@selector(crash) withObject:self afterDelay:5.0];
}

- (void)crash{
    NSArray *arr=[NSArray array];
    NSLog(@"%@",arr[2]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
