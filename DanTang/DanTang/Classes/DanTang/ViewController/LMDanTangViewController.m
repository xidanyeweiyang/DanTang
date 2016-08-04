//
//  LMDanTangViewController.m
//  练习纯手码项目
//
//  Created by 刘明 on 16/8/2.
//  Copyright © 2016年 刘明. All rights reserved.
//

#import "LMDanTangViewController.h"
#import "LMContentTableViewController.h"
#import "LMDanTangModel.h"


@interface LMDanTangViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIView *tittleViewBackView;

@property (nonatomic, strong) UIView *titleView;

@property (nonatomic, strong) UIButton *selectBtn;

@property (nonatomic, strong) UIView *indicatorView;

@property (nonatomic, strong) UIScrollView *contentBackView;

@property (nonatomic, strong) NSArray *tittleArray;
@end

@implementation LMDanTangViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [self loadTopData];
}

- (void)loadTopData{
    
    kWeakSelf(self);
    
    [LMHttpManager loadDanTangTopInfo:^(id response, NSError *error) {
        
        weakSelf.tittleArray = response;
        // 设置子控制器
        [weakSelf setupChildView];
        //设置顶部标签栏
        [weakSelf setupTitlesView];
        // 底部的scrollview
        [weakSelf setupContentView];
        
    }];
}


- (void)setupChildView{
    
    for (int i = 0; i < self.tittleArray.count; i++) {
        
        LMDanTangModel *model = self.tittleArray[i];
        
        
        LMContentTableViewController *contentVC = [[LMContentTableViewController alloc] init];
        
        contentVC.title = model.name;
        
        contentVC.type = model.id;
        
        [self addChildViewController:contentVC];
        
    }

}


#define 设置顶部标签栏
- (void)setupTitlesView {
    
    kWeakSelf(self);

    self.tittleViewBackView = [[UIView alloc] init];
    
    self.tittleViewBackView.backgroundColor = LMGlobalColor;
    
    [self.view addSubview:self.tittleViewBackView];

    [self.tittleViewBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.equalTo(weakSelf.view);
        make.top.equalTo(weakSelf.view).with.mas_offset(64);
        make.height.mas_equalTo(35);

    }];
    
    
    
    UIButton *arrowBtn = [[UIButton alloc] init];
    
    [self.tittleViewBackView addSubview:arrowBtn];
    
    [arrowBtn setImage:[UIImage imageNamed:@"arrow_index_down_8x4_"] forState:UIControlStateNormal];
    
    [arrowBtn addTarget:self action:@selector(didClickArrowBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    [arrowBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.width.height.mas_equalTo(35);
        make.left.equalTo(weakSelf.tittleViewBackView).with.mas_offset(kScreenWidth - 35);
        
        make.top.equalTo(weakSelf.tittleViewBackView);
        
    }];
    
    
    
    UIView *titleView = [[UIView alloc] init];
    
    self.titleView = titleView;
    
    titleView.backgroundColor = LMGlobalColor;
    
    [self.tittleViewBackView addSubview:titleView];
    
    [titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.top.bottom.equalTo(weakSelf.tittleViewBackView);
        make.right.equalTo(arrowBtn.mas_left);
        
    }];
    
    
    self.indicatorView = [[UIView alloc] init];
    
    [titleView addSubview:self.indicatorView];
    
    self.indicatorView.backgroundColor = LMGlobalRedColor;
    
    self.indicatorView.height = 2;
    
    self.indicatorView.y = 35 - 2;
    
    self.indicatorView.tag = -1;
    
    
    CGFloat width = (kScreenWidth - 35)/ self.tittleArray.count;
    
    for (int i = 0; i < self.tittleArray.count; i++) {
        
        LMDanTangModel *model = self.tittleArray[i];
        
        UIButton *btn = [[UIButton alloc] init];
        
        [titleView addSubview:btn];
        
        [btn setTitle: model.name forState:UIControlStateNormal];
        
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        
        [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        
        [btn setTitleColor:LMGlobalRedColor forState:UIControlStateDisabled];
        
        btn.frame = CGRectMake(i * width, 0, width, 35);
        
        [btn addTarget:self action:@selector(didClickTittlBtn:) forControlEvents:UIControlEventTouchUpInside];
        
        btn.tag = 1000+i;
        
        if (i == 0) {
           
            self.selectBtn = btn;
            
            btn.enabled = NO;
            
            [btn.titleLabel sizeToFit];
            
            self.indicatorView.width = btn.titleLabel.width;
            
            self.indicatorView.centerX = btn.centerX;
        }
    }
    
    

    
}
//点击标签按钮
- (void)didClickTittlBtn:(UIButton *)sender{
    
    self.selectBtn.enabled = YES;
    
    sender.enabled = NO;
    
    self.selectBtn = sender;

    kWeakSelf(self);
    
    [UIView animateWithDuration:0.25 animations:^{
        
       
        weakSelf.indicatorView.width = self.selectBtn.titleLabel.width;
        
        weakSelf.indicatorView.centerX = self.selectBtn.centerX;
        
    }];
    
    CGPoint offset = self.contentBackView.contentOffset;
    
    offset.x = kScreenWidth * (sender.tag - 1000);
    
    [self.contentBackView setContentOffset:offset animated:YES];
    
    
}

//点击箭头按钮
- (void)didClickArrowBtn:(UIButton *)sender{
    
    [UIView animateWithDuration:0.25 animations:^{
        
        
        sender.imageView.transform = CGAffineTransformRotate(sender.imageView.transform, M_PI);
    }];
    
}

#define 底部的scrollview
- (void)setupContentView {
    
    kWeakSelf(self);
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIScrollView *contentBackView = [[UIScrollView alloc] init];
    
    self.contentBackView = contentBackView;
    
    contentBackView.delegate = self;
    
    contentBackView.pagingEnabled = YES;
    
    contentBackView.contentSize = CGSizeMake(kScreenWidth * self.tittleArray.count, 0);
    
//    [self.view insertSubview:contentBackView atIndex:0];
    [self.view addSubview:contentBackView];
    
    [contentBackView mas_makeConstraints:^(MASConstraintMaker *make) {

        make.top.equalTo(weakSelf.tittleViewBackView.mas_bottom).with.mas_offset(0);
        make.left.right.bottom.equalTo(weakSelf.view);
        
    }];
    
    
    
    [self scrollViewDidEndScrollingAnimation:contentBackView];
    
}


#define scrollerView的代理方法

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    
    int contentOffset = (int)(scrollView.contentOffset.x / kScreenWidth);

    UIViewController *childVC = self.childViewControllers[contentOffset];
    
    childVC.view.x = scrollView.contentOffset.x;
    childVC.view.height = scrollView.height;
    childVC.view.y = 0;
    childVC.view.width = kScreenWidth;
    
    [self.contentBackView addSubview:childVC.view];
    

    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    [self scrollViewDidEndScrollingAnimation:scrollView];
    
    int contentOffset = (int)(scrollView.contentOffset.x / kScreenWidth);
    
    for (UIButton *btn in self.titleView.subviews) {
        
        if (btn.tag - 1000  == contentOffset) {
            
            [self didClickTittlBtn:btn];
        }
    }
    
    
    
}

@end
