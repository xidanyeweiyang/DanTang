//
//  LMProductHeaderCollectionViewCell.m
//  DanTang
//
//  Created by 刘明 on 16/8/9.
//  Copyright © 2016年 刘明. All rights reserved.
//

#import "LMProductHeaderCollectionViewCell.h"

@implementation LMProductHeaderCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = LMGlobalWhiteColor;
        
        [self setupUI];
    }
    
    return self;
}

- (void)setImage_url:(NSString *)image_url{
    
    _image_url = image_url;
    
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:image_url] placeholderImage:[UIImage imageNamed:@"PlaceHolderImage_small_31x26_"]];
}

- (void)setupUI{
    
    kWeakSelf(self)

    UIImageView *imageView = [[UIImageView alloc] init];
    
    self.imageView = imageView;
    
    [self.contentView addSubview:imageView];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(weakSelf);
        
    }];

}
@end
