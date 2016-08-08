//
//  LMProductCollectionViewCell.m
//  DanTang
//
//  Created by 刘明 on 16/8/5.
//  Copyright © 2016年 刘明. All rights reserved.
//

#import "LMProductCollectionViewCell.h"

@interface LMProductCollectionViewCell ()


@property (nonatomic, strong) UIImageView *pictureView;

@property (nonatomic, strong) UILabel *descLabel;

@property (nonatomic, strong) UILabel *priceLabel;

@property (nonatomic, strong) UIButton *favoriterBtn;
@end


@implementation LMProductCollectionViewCell



- (void)setProduct:(LMProduct *)product{
    
    _product = product;
    
    [self setupData];
}

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
    self.pictureView = imageView;
    
    imageView.userInteractionEnabled = YES;
    
    [self.contentView addSubview:imageView];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.right.top.equalTo(weakSelf.contentView);
        make.height.mas_offset(@164);
        
    }];

    
    
    
    UILabel *descLabel = [[UILabel alloc] init];
    self.descLabel = descLabel;
    descLabel.font = [UIFont systemFontOfSize:16];
    
    descLabel.numberOfLines = 2;
    [self.contentView addSubview:descLabel];
    
    [descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.right.equalTo(weakSelf.contentView);
        make.left.equalTo(weakSelf.contentView).with.offset(5);
        make.top.equalTo(imageView.mas_bottom).with.offset(12);
        
    }];
    
    UILabel *priceLabel = [[UILabel alloc] init];
    self.priceLabel = priceLabel;
    priceLabel.font = [UIFont systemFontOfSize:15];

    priceLabel.textColor = LMGlobalRedColor;
    [self.contentView addSubview:priceLabel];
    
    [priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(descLabel);
        make.bottom.equalTo(weakSelf.contentView.mas_bottom).with.offset(-5);
        
    }];
    
    
    UIButton *favoriterBtn = [[UIButton alloc] init];
    self.favoriterBtn = favoriterBtn;

    [favoriterBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    favoriterBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:favoriterBtn];
    
    [favoriterBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(weakSelf.contentView).with.offset(-5);
        make.height.centerY.equalTo(priceLabel);
        
    }];
    
}


- (void)setupData{

    [self.pictureView sd_setImageWithURL:[NSURL URLWithString:self.product.cover_image_url] placeholderImage:[UIImage imageNamed:@"PlaceHolderImage_small_31x26_"]];
    [self.favoriterBtn setImage:[UIImage imageNamed:@"Search_GiftBtn_Default_12x10_"] forState:UIControlStateNormal];
    [self.favoriterBtn setTitle:[NSString stringWithFormat:@" %zd ",self.product.favorites_count] forState:UIControlStateNormal];
    
    self.priceLabel.text = [NSString stringWithFormat:@"￥%@",self.product.price];
    
    self.descLabel.text = self.product.name;
    
}
@end
