//
//  LMProductDetialHeaderView.m
//  DanTang
//
//  Created by 刘明 on 16/8/9.
//  Copyright © 2016年 刘明. All rights reserved.
//

#import "LMProductDetialHeaderView.h"
#import "LMProductHeaderCollectionViewCell.h"

@implementation LMProductDetialHeaderView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self == [super initWithFrame:frame]) {
        
        [self setupUI];
        
        self.backgroundColor = LMGlobalWhiteColor;
    }
    return self;
}

- (void)setProductDetail:(LMProductDetail *)productDetail{
    
    _productDetail = productDetail;
    
    [self setupData];
}


- (void)setupData{
    
    self.titleLabel.text = self.productDetail.name;
    self.priceLabel.text = [NSString stringWithFormat:@"￥%@",self.productDetail.price];
    self.describeLabel.text = self.productDetail.describe;
    
    self.imageArray = self.productDetail.image_urls;
    
    self.pageControl.numberOfPages = self.productDetail.image_urls.count;
    
}

- (void)setupUI{
    
    kWeakSelf(self)
    
    UIView *backView = [[UIView alloc] init];
    self.backView = backView;
    [self addSubview:backView];
    
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.top.right.equalTo(weakSelf);
        make.height.mas_offset(375);
    }];

    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.itemSize = CGSizeMake(kScreenWidth, 375);

    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 375)collectionViewLayout:flowLayout];
    
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.showsHorizontalScrollIndicator = NO;
    collectionView.backgroundColor = LMGlobalColor;
    collectionView.pagingEnabled = YES;
    [collectionView registerClass:[LMProductHeaderCollectionViewCell class] forCellWithReuseIdentifier:@"LMProductHeaderCollectionViewCell"];
    
    self.collectionView = collectionView;
    [backView addSubview:collectionView];
    

    
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    pageControl.currentPage = 0;
    pageControl.currentPageIndicatorTintColor = LMGlobalRedColor;
    pageControl.pageIndicatorTintColor = LMGlobalColor;
    self.pageControl = pageControl;
    [self addSubview:pageControl];
    
    [pageControl mas_makeConstraints:^(MASConstraintMaker *make) {

        make.centerX.equalTo(weakSelf);
        make.bottom.equalTo(backView).with.offset(-15);
    }];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    self.titleLabel = titleLabel;
    titleLabel.font = [UIFont systemFontOfSize:16];
    [self addSubview:titleLabel];
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(weakSelf).with.offset(5);
        make.top.equalTo(weakSelf).with.offset(385);
        
    }];
    
    UILabel *priceLabel = [[UILabel alloc] init];
    self.priceLabel = priceLabel;
    priceLabel.font = [UIFont systemFontOfSize:15];
    
    priceLabel.textColor = LMGlobalRedColor;
    [self addSubview:priceLabel];
    
    [priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(titleLabel);
        make.top.equalTo(titleLabel.mas_bottom).with.offset(10);
        
    }];

    
    UILabel *describeLabel = [[UILabel alloc] init];
    self.describeLabel = describeLabel;
    describeLabel.font = [UIFont systemFontOfSize:15];
    describeLabel.numberOfLines = 3;
    describeLabel.textColor = [UIColor lightGrayColor];
    [self addSubview:describeLabel];
    
    [describeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(priceLabel);
        make.right.equalTo(weakSelf).with.offset(-5);
        make.top.equalTo(priceLabel.mas_bottom).with.offset(10);
        
    }];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.imageArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    LMProductHeaderCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LMProductHeaderCollectionViewCell" forIndexPath:indexPath];
    
    cell.image_url = self.imageArray[indexPath.item];
    
    return cell;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    kWeakSelf(self)
    
    CGFloat offset = [scrollView contentOffset].x;
    
    int index = (int)(offset / kScreenWidth);
    
    [UIView animateWithDuration:0.25 animations:^{
        
        weakSelf.pageControl.currentPage = index;
    }];
}

@end
