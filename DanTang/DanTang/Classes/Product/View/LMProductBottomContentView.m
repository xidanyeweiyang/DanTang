//
//  LMProductBottomContentView.m
//  DanTang
//
//  Created by 刘明 on 16/8/10.
//  Copyright © 2016年 刘明. All rights reserved.
//

#import "LMProductBottomContentView.h"
#import "LMCommentTableViewCell.h"
#import "LMContentTableViewCell.h"
#import "LMComments.h"

@interface LMProductBottomContentView ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource,UIWebViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView ;

@end
@implementation LMProductBottomContentView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self == [super initWithFrame:frame]) {
        
        [self setupUI];

    }
    return self;
}

- (void)setProductDetail:(LMProductDetail *)productDetail{
    
    _productDetail = productDetail;
 
    [self setupData];
}


- (void)setupData{
    
    [self.webView loadHTMLString:self.productDetail.detail_html baseURL:nil];
    
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    
}

- (void)setupUI{
    
    kWeakSelf(self)
    
    self.delegate = self;
    self.showsHorizontalScrollIndicator = NO;
    self.contentSize = CGSizeMake(2*kScreenWidth, 0);
    self.pagingEnabled = YES;
    self.bounces = NO;
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.bounds];
    self.webView  = webView;
    webView.scalesPageToFit = YES;
    webView.dataDetectorTypes = UIDataDetectorTypeAll;
    webView.delegate = self;
//    [self.webView loadHTMLString:self.productDetail.detail_html baseURL:nil];
    [self addSubview:webView];
 
    
    
    UITableView *commentTableView = [[UITableView alloc] initWithFrame:CGRectMake(kScreenWidth, 0, kScreenWidth, self.height)];
    self.commentTableView = commentTableView;
    commentTableView.dataSource = self;
    commentTableView.delegate = self;
    commentTableView.rowHeight = 64;
    [commentTableView registerClass:[LMCommentTableViewCell class] forCellReuseIdentifier:@"LMCommentTableViewCell"];
    [self addSubview:commentTableView];

}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    int index = scrollView.contentOffset.x / kScreenWidth;
    
    if (self.scollDelegate && [self.scollDelegate respondsToSelector:@selector(scrollContent:anWithIndex:)]) {
        
        [self.scollDelegate scrollContent:self anWithIndex:index];
    }

}


#pragma mark -webView代理

- (void)webViewDidStartLoad:(UIWebView *)webView{
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

#pragma mark -tableView代理

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.commentArray.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    LMCommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LMCommentTableViewCell" forIndexPath:indexPath];
    
    cell.comment = self.commentArray[indexPath.row];
    
    
    return cell;
}

- (NSMutableArray *)commentArray{
    
    if (!_commentArray) {
        
        _commentArray = [NSMutableArray arrayWithCapacity:10];
    }
    return _commentArray;
}




@end
