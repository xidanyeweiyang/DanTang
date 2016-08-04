//
//  LMDetailViewController.m
//  DanTang
//
//  Created by 刘明 on 16/8/4.
//  Copyright © 2016年 刘明. All rights reserved.
//

#import "LMDetailViewController.h"

@interface LMDetailViewController ()<UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *webView;

@end

@implementation LMDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    kWeakSelf(self);
    
    UIWebView *webView = [[UIWebView alloc] init];
    
    webView.scalesPageToFit = YES;
    
    webView.dataDetectorTypes = UIDataDetectorTypeAll;
    
    self.webView = webView;
    
    [self.view addSubview:self.webView];
    
    [webView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.left.right.bottom.equalTo(weakSelf.view);
   
    }];
    
   
    self.webView.delegate = self;
    
    
    NSURL *url = [NSURL URLWithString:self.item.content_url];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [self.webView loadRequest:request];
    
    
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    
    [SVProgressHUD showWithStatus:@"正在加载"];
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
    [SVProgressHUD dismiss];
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
}


- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    
    return YES;
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
