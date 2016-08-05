//
//  LMProductCollectionViewCell.m
//  DanTang
//
//  Created by 刘明 on 16/8/5.
//  Copyright © 2016年 刘明. All rights reserved.
//

#import "LMProductCollectionViewCell.h"

@implementation LMProductCollectionViewCell


//+ (instancetype)initWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexpath{
//    
//    LMProductCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LMProductCollectionViewCell" forIndexPath:indexpath];
//    
//    if (!cell) {
//        
//        cell = [[LMProductCollectionViewCell alloc] init];
//        
//        [cell setupUI];
//
//    }
//    
//    return cell;
//}

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = LMGlobalWhiteColor;

        [self setupUI];
    }
    
    return self;
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    

}



- (void)setupUI{
    
    kWeakSelf(self)
    
    UIImageView *imageView = [[UIImageView alloc] init];
    
    imageView.userInteractionEnabled = YES;
    
    [self.contentView addSubview:imageView];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.right.top.equalTo(weakSelf.contentView);
        make.height.mas_offset(@164);
        
    }];
    
    
    imageView.image = [UIImage imageNamed:@"PlaceHolderImage_small_31x26_"];
    
    
    
    UILabel *descLabel = [[UILabel alloc] init];
    descLabel.font = [UIFont systemFontOfSize:16];
    descLabel.text = @"xixiix";
    [self.contentView addSubview:descLabel];
    
    [descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.right.equalTo(weakSelf.contentView);
        make.left.equalTo(weakSelf.contentView).with.offset(5);
        make.top.equalTo(imageView.mas_bottom).with.offset(12);
        
    }];
    
    UILabel *priceLabel = [[UILabel alloc] init];
    priceLabel.font = [UIFont systemFontOfSize:15];
    priceLabel.text = @"h打开几个";
    priceLabel.textColor = LMGlobalRedColor;
    [self.contentView addSubview:priceLabel];
    
    [priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(descLabel);
        make.bottom.equalTo(weakSelf.contentView.mas_bottom).with.offset(-5);
        
    }];
    
    
    UIButton *favoriterBtn = [[UIButton alloc] init];
    [favoriterBtn setImage:[UIImage imageNamed:@"Search_GiftBtn_Default_12x10_"] forState:UIControlStateNormal];
    [favoriterBtn setTitle:@"68" forState:UIControlStateNormal];
    [favoriterBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    favoriterBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:favoriterBtn];
    
    [favoriterBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(weakSelf.contentView).with.offset(-5);
        make.height.centerY.equalTo(priceLabel);
        
    }];
    
}
@end
