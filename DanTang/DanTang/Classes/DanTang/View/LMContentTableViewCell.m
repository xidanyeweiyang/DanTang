//
//  LMContentTableViewCell.m
//  DanTang
//
//  Created by 刘明 on 16/8/3.
//  Copyright © 2016年 刘明. All rights reserved.
//

#import "LMContentTableViewCell.h"

@implementation LMContentTableViewCell

+ (instancetype)initWithTable:(UITableView *)tableView{
    
    LMContentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LMContentTableViewCell"];
    
    if (cell == nil) {
        
        cell = [[LMContentTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCellStyleDefault"];
        
    }
    
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
//        [self setupUI];
    }
    
    return  self;
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    self.width = kScreenWidth;
    self.height = 160;

}

- (void)setItem:(LMItems *)item{
    
    _item = item;
    
    [self setupUI];
}

- (void)setupUI {

    kWeakSelf(self);
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.userInteractionEnabled = YES;
    imageView.layer.cornerRadius = 5;
    imageView.layer.masksToBounds = YES;
//    imageView.layer.shouldRasterize = YES;
//    imageView.layer.rasterizationScale = [UIScreen mainScreen].scale;
    
    [imageView sd_setImageWithURL:[NSURL URLWithString:self.item.cover_image_url] placeholderImage:[UIImage imageNamed:@"PlaceHolderImage_small_31x26_"]];
    
    [self.contentView addSubview:imageView];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(weakSelf).with.insets(UIEdgeInsetsMake(10, 10, 10, 10));
 
    }];

    UILabel *label = [[UILabel alloc] init];
    label.text = self.item.title;
    label.textColor = LMGlobalWhiteColor;
    label.font = [UIFont systemFontOfSize:18];
    
    [self.contentView addSubview:label];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(imageView).with.offset(5);
        make.bottom.equalTo(imageView).with.offset(-5);
    }];
    
    
    UIButton *favoriteBtn = [[UIButton alloc] init];
    [favoriteBtn setImage:[UIImage imageNamed:@"Feed_FavoriteIcon_17x17_"] forState:UIControlStateNormal];
    [favoriteBtn setTitleColor:LMGlobalWhiteColor forState:UIControlStateNormal];
    [favoriteBtn setTitle:[NSString stringWithFormat:@" %zd ",self.item.likes_count] forState:UIControlStateNormal];
    [favoriteBtn setBackgroundColor:RGBA(0, 0, 0, 0.5)];
    favoriteBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    favoriteBtn.layer.cornerRadius = 25 * 0.5;
    favoriteBtn.layer.masksToBounds = YES;
//    favoriteBtn.layer.shouldRasterize = YES;
//    favoriteBtn.layer.rasterizationScale = [UIScreen mainScreen].scale;
    
    [favoriteBtn addTarget:self action:@selector(didClickFavoritorBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:favoriteBtn];
    
    [favoriteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.right.equalTo(imageView).with.offset(-10);
        make.top.equalTo(imageView).with.offset(10);
        make.height.mas_equalTo(25);
//        make.width.mas_equalTo(50);
        
    }];
 
}



- (void)didClickFavoritorBtn:(UIButton *)sender{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(didClickDanTangCellFavoritorBtn:)]) {
        [self.delegate didClickDanTangCellFavoritorBtn:sender];
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
