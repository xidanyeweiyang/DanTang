
//
//  LMClassifyViewController.m
//  练习纯手码项目
//
//  Created by 刘明 on 16/8/2.
//  Copyright © 2016年 刘明. All rights reserved.
//

#import "LMClassifyViewController.h"

@interface LMClassifyViewController ()

@end

@implementation LMClassifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *backView = [[UIView alloc] initWithFrame:self.view.bounds];
    
    backView.backgroundColor = [UIColor orangeColor];
    
    [self.view addSubview:backView];
    
    

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
