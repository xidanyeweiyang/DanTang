//
//  LMBaseViewController.m
//  练习纯手码项目
//
//  Created by 刘明 on 16/8/2.
//  Copyright © 2016年 刘明. All rights reserved.
//

#import "LMBaseViewController.h"

@interface LMBaseViewController ()

@end

@implementation LMBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = LMGlobalColor;
    
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleCustom];
    [SVProgressHUD setMinimumDismissTimeInterval:1];
    [SVProgressHUD setBackgroundColor:RGBA(0, 0, 0, 0.5)];
    [SVProgressHUD setForegroundColor:LMGlobalWhiteColor];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
