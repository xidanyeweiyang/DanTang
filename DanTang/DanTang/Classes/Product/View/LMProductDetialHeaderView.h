//
//  LMProductDetialHeaderView.h
//  DanTang
//
//  Created by 刘明 on 16/8/9.
//  Copyright © 2016年 刘明. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LMProductDetail.h"
@interface LMProductDetialHeaderView : UIView<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) LMProductDetail *productDetail;

@property (nonatomic, strong) UIView *backView;

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) UIPageControl *pageControl;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *describeLabel;

@property (nonatomic, strong) UILabel *priceLabel;

@property (nonatomic, strong) NSArray *imageArray;

@end
