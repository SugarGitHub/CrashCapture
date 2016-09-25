//
//  CrashViewController.h
//  CrashCapture
//
//  Created by suhengxian on 16/1/26.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import <UIKit/UIKit.h>
#define ERRORPATH  [NSString stringWithFormat:@"%@/error.log",[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]]
@interface CrashViewController : UIViewController

@end

