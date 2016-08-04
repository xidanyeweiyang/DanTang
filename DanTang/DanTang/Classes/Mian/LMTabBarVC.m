//
//  LMTabBarVC.m
//  练习纯手码项目
//
//  Created by 刘明 on 16/7/28.
//  Copyright © 2016年 刘明. All rights reserved.
//

#import "LMTabBarVC.h"
#import "LMDanTangViewController.h"
#import "LMProductViewController.h"
#import "LMMeViewController.h"
#import "LMClassifyViewController.h"

@interface LMTabBarVC ()

@end

@implementation LMTabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tabBar setTintColor:RGB(245 , 80 , 83 )];
   
    [self setChildVC];
}

- (void)setChildVC{
    
    
    [self addChildTabBarVC:@"LMDanTangViewController" tittle:@"单糖" andImageName:@"TabBar_home_23x23_"];
    [self addChildTabBarVC:@"LMProductViewController" tittle:@"单品" andImageName:@"TabBar_gift_23x23_"];

    [self addChildTabBarVC:@"LMClassifyViewController" tittle:@"分类" andImageName:@"TabBar_category_23x23_"];
    [self addChildTabBarVC:@"LMMeViewController" tittle:@"我" andImageName:@"TabBar_me_boy_23x23_"];
}

- (void)addChildTabBarVC:(NSString *)viewController tittle:(NSString *)tittle andImageName:(NSString *)imageName{
    
    UIViewController *vc = [[NSClassFromString(viewController) alloc] init];

    LMNavigationController *nav = [[LMNavigationController alloc] initWithRootViewController:vc];
    vc.title = tittle;
    vc.tabBarItem.title = tittle;
    [vc.tabBarItem setImage:[UIImage imageNamed:imageName]];
    [vc.tabBarItem setSelectedImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@selected",imageName]]];
    [self addChildViewController:nav];
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
