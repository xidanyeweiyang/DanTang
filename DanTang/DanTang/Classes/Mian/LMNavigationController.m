//
//  LMNavigationController.m
//  练习纯手码项目
//
//  Created by 刘明 on 16/8/2.
//  Copyright © 2016年 刘明. All rights reserved.
//

#import "LMNavigationController.h"

@interface LMNavigationController ()

@end

@implementation LMNavigationController

+ (void)initialize{
    
    [super initialize];
    
    //    [bar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
    
    UINavigationBar *bar = [UINavigationBar appearance];
    bar.barTintColor = LMGlobalRedColor;
    bar.tintColor = LMGlobalWhiteColor;
    bar.titleTextAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:20],NSForegroundColorAttributeName:LMGlobalWhiteColor};
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.childViewControllers.count > 0) {
        
//        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//        [btn setTitle:@"返回" forState:UIControlStateNormal];
//        [btn setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
//        [btn setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
//        btn.size = CGSizeMake(70, 30);
//        //左对齐
//        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//        //按钮的内容往左边偏移10
//        btn.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
//        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        [btn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
//        [btn addTarget:self action:@selector(navigationBackClick) forControlEvents:UIControlEventTouchUpInside];
//        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
        
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"checkUserType_backward_9x15_"] style:UIBarButtonItemStylePlain target:self action:@selector(navigationBackClick)];
        
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
}

- (void)navigationBackClick{
    
    if ([SVProgressHUD isVisible]) {
        
        [SVProgressHUD dismiss];
    }
    
    if ([UIApplication sharedApplication].networkActivityIndicatorVisible) {
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    }
    
    [self popViewControllerAnimated:YES];
}

@end
