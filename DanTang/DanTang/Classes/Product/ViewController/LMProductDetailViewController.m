//
//  LMProductDetailViewController.m
//  DanTang
//
//  Created by 刘明 on 16/8/9.
//  Copyright © 2016年 刘明. All rights reserved.
//

#import "LMProductDetailViewController.h"
#import "LMProductDetialHeaderView.h"
#import "LMCommentTableViewCell.h"
#import "LMProductBottomContentView.h"
#import "LMProductWebViewViewController.h"


@interface LMProductDetailViewController ()<UIWebViewDelegate,LMProductBottomContentViewDelegate>

@property (nonatomic, strong) LMProductDetialHeaderView *headerView;

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) UIButton *pictureIntroduceBtn;

@property (nonatomic, strong) UIButton *commentBtn;

@property (nonatomic, strong) UIView *lineView;

@property (nonatomic, strong) LMProductBottomContentView *contentView;

@property (nonatomic, strong) UIWebView *webView;

@property (nonatomic, strong) UIScrollView *bottomScollView;

@end

@implementation LMProductDetailViewController


- (void)viewDidLayoutSubviews{
    
    [super viewDidLayoutSubviews];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;

//    [self requestCommetData];
    
    [self setupUI];
    
   
    self.navigationController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"GiftShare_icon_18x22_"] style:UIBarButtonItemStylePlain target:self action:@selector(didClickRightItem)];
}

- (void)setupUI {
    
    kWeakSelf(self);
    
    UIView *toolBarView = [[UIView alloc] init];
    
    [toolBarView setBackgroundColor:LMGlobalWhiteColor];
    [self.view addSubview:toolBarView];
    
    [toolBarView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.bottom.equalTo(weakSelf.view);
        make.height.mas_equalTo(@44);
        
    }];
    
    UIButton *likeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [toolBarView addSubview:likeBtn];
    [likeBtn setBackgroundColor:LMGlobalWhiteColor];
    likeBtn.layer.borderWidth   = 1;
    likeBtn.layer.borderColor   = LMGlobalRedColor.CGColor;
    likeBtn.layer.cornerRadius  = 15;
    likeBtn.layer.masksToBounds = YES;
    [likeBtn setImage:[UIImage imageNamed:@"content-details_like_16x16_"] forState:UIControlStateNormal];
    [likeBtn setImage:[UIImage imageNamed:@"content-details_like_selected_16x16_"] forState:UIControlStateSelected];
    [likeBtn setTitle:@" 喜欢" forState:UIControlStateNormal];
    [likeBtn setTitleColor:LMGlobalRedColor forState:UIControlStateNormal];
    likeBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [likeBtn addTarget:self action:@selector(didClickLikeBtn:) forControlEvents:UIControlEventTouchUpInside];
    [likeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(toolBarView).with.offset(15);
        make.height.mas_equalTo(@30);
        make.width.mas_equalTo(@100);
        make.centerY.equalTo(toolBarView);
    }];
    
    
    UIButton *buyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [toolBarView addSubview:buyBtn];
    [buyBtn setBackgroundColor:LMGlobalRedColor];
    buyBtn.layer.borderWidth   = 1;
    buyBtn.layer.borderColor   = LMGlobalRedColor.CGColor;
    buyBtn.layer.cornerRadius  = 15;
    buyBtn.layer.masksToBounds = YES;
    [buyBtn setTitle:@"去天猫购买" forState:UIControlStateNormal];
    [buyBtn setTitleColor:LMGlobalWhiteColor forState:UIControlStateNormal];
    buyBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [buyBtn addTarget:self action:@selector(didClickGoToBuy) forControlEvents:UIControlEventTouchUpInside];
    [buyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(likeBtn.mas_right).with.offset(15);
        make.height.mas_equalTo(@30);
        make.right.equalTo(toolBarView).with.offset(-15);
        make.centerY.equalTo(toolBarView);
    }];
    
    
    
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    self.scrollView = scrollView;
    self.scrollView.contentSize = CGSizeMake(0, 64+520 + 10 + kScreenHeight - 64 - 44);
    [self.view addSubview:scrollView];
    
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.right.equalTo(weakSelf.view);
        make.bottom.equalTo(toolBarView.mas_top);

    }];
    

    LMProductDetialHeaderView *headerView = [[LMProductDetialHeaderView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, 520)];
    
    headerView.productDetail = self.productDetail;
    
    [self.scrollView addSubview:headerView];
    
    
    UIButton *pictureIntroduceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.pictureIntroduceBtn = pictureIntroduceBtn;
    [self.scrollView addSubview:pictureIntroduceBtn];
    [pictureIntroduceBtn setBackgroundColor:LMGlobalWhiteColor];
    [pictureIntroduceBtn setTitle:@"图文介绍" forState:UIControlStateNormal];
    [pictureIntroduceBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    pictureIntroduceBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [pictureIntroduceBtn addTarget:self action:@selector(didClickPictureIntroduceBtn:) forControlEvents:UIControlEventTouchUpInside];
    CGFloat choosBtnWidth =  (kScreenWidth - 1)/2;
    [pictureIntroduceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(weakSelf.scrollView);
        make.height.mas_equalTo(@36);
        make.width.mas_equalTo(choosBtnWidth);
        make.top.equalTo(headerView.mas_bottom).with.offset(10);
    }];
    
    
    UIButton *commentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.commentBtn = commentBtn;
    [self.scrollView addSubview:commentBtn];
    [commentBtn setBackgroundColor:LMGlobalWhiteColor];
    [commentBtn setTitle:[NSString stringWithFormat:@"评论(%zd)",self.productDetail.comments_count] forState:UIControlStateNormal];
    [commentBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    commentBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [commentBtn addTarget:self action:@selector(didClickCommentBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    [commentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(weakSelf.view);
        make.height.mas_equalTo(@36);
        make.width.mas_equalTo(choosBtnWidth);
        make.top.equalTo(headerView.mas_bottom).with.offset(10);
    }];
    

    UIView *lineView = [[UIView alloc] init];
    self.lineView =lineView;
    [lineView setBackgroundColor:LMGlobalRedColor];
    [self.scrollView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.height.mas_equalTo(@5);
        make.width.equalTo(pictureIntroduceBtn);
        make.left.equalTo(pictureIntroduceBtn);
        make.top.equalTo(pictureIntroduceBtn.mas_bottom);
        
    }];
    

    
    LMProductBottomContentView *contentView = [[LMProductBottomContentView alloc] initWithFrame:CGRectMake(0,64+520+10+36+5, kScreenWidth, kScreenHeight - 64 - 44 - 36 - 5)];
    contentView.scollDelegate = self;
    [self.scrollView addSubview:contentView];
    self.contentView = contentView;
    contentView.productDetail = self.productDetail;
    
   
}

#pragma mark 滑动内容模块的代理方法
- (void)scrollContent:(LMProductBottomContentView *)contentView anWithIndex:(NSInteger)index{
    
    if (index == 1) {
        
        [self didClickCommentBtn:self.commentBtn];
        
    }else if (index == 0){
        
        [self didClickPictureIntroduceBtn:self.pictureIntroduceBtn];

    }

}

- (void)setProductDetail:(LMProductDetail *)productDetail{
    
    _productDetail = productDetail;
    
    [self.webView loadHTMLString:self.productDetail.detail_html baseURL:nil];
}
//评论按钮
- (void)didClickCommentBtn:(UIButton *)sender{
    
    kWeakSelf(self);
    
    [self.lineView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@5);
        make.width.equalTo(weakSelf.commentBtn);
        make.left.equalTo(weakSelf.commentBtn);
        make.top.equalTo(weakSelf.commentBtn.mas_bottom);
    }];
    
    
    [LMHttpManager loadProductCommentInfo:self.productDetail.id Finished:^(id response, NSError *error) {
        
       
        weakSelf.contentView.commentArray = response;
        
        [weakSelf.contentView.commentTableView reloadData];
        
    }];
    
    [self.contentView setContentOffset:CGPointMake(kScreenWidth, 0) animated:YES];

}

//图文介绍按钮
- (void)didClickPictureIntroduceBtn:(UIButton *)sender{
    
    
    kWeakSelf(self);
    [self.lineView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@5);
        make.width.equalTo(weakSelf.pictureIntroduceBtn);
        make.left.equalTo(weakSelf.pictureIntroduceBtn);
        make.top.equalTo(weakSelf.pictureIntroduceBtn.mas_bottom);
        
    }];
    
    [self.contentView setContentOffset:CGPointMake(0, 0) animated:YES];
}

//喜欢按钮
- (void)didClickLikeBtn:(UIButton *)sender{
    
    sender.selected = !sender.selected;
}

//去天猫购买
- (void)didClickGoToBuy{
    
    LMProductWebViewViewController *webView = [[LMProductWebViewViewController alloc] init];
    
    webView.urlString = self.productDetail.purchase_url;
    
    [self.navigationController pushViewController:webView animated:YES];
    
}

//分享
- (void)didClickRightItem{
    
    
}

@end
