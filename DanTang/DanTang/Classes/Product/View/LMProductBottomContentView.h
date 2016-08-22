//
//  LMProductBottomContentView.h
//  DanTang
//
//  Created by 刘明 on 16/8/10.
//  Copyright © 2016年 刘明. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LMProductDetail.h" 
@class LMProductBottomContentView;
@protocol LMProductBottomContentViewDelegate <NSObject>

- (void)scrollContent:(LMProductBottomContentView *)contentView anWithIndex:(NSInteger)index;

@end

@interface LMProductBottomContentView : UIScrollView<UIWebViewDelegate,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) LMProductDetail *productDetail;

@property (nonatomic, strong) UIScrollView *bottomScollView;

@property (nonatomic, strong) UIWebView *webView;

@property (nonatomic, strong)  UITableView *commentTableView;

@property (nonatomic, strong) NSMutableArray *commentArray;

@property (nonatomic, weak) id<LMProductBottomContentViewDelegate> scollDelegate;

@end
