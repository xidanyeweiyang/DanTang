//
//  LMProductWebViewViewController.m
//  DanTang
//
//  Created by 刘明 on 16/8/22.
//  Copyright © 2016年 刘明. All rights reserved.
//

#import "LMProductWebViewViewController.h"

@interface LMProductWebViewViewController ()<UIWebViewDelegate>

@end

@implementation LMProductWebViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"商品详情";
    
    self.navigationController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"GiftShare_icon_18x22_"] style:UIBarButtonItemStylePlain target:self action:@selector(didClickRightItem)];

    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:webView];
    webView.delegate = self;
    webView.scalesPageToFit = YES;
    webView.dataDetectorTypes = UIDataDetectorTypeAll;
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:self.urlString]];
    
    [webView loadRequest:request];
    
}

//分享
- (void)didClickRightItem{
    
    
}
- (void)webViewDidStartLoad:(UIWebView *)webView{
    
    
    [SVProgressHUD showWithStatus:@"数据加载中,请稍后..."];
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
    [SVProgressHUD dismiss];
 
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;

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
