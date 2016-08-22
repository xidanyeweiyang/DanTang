//
//  LMCommentTableViewCell.m
//  DanTang
//
//  Created by 刘明 on 16/8/10.
//  Copyright © 2016年 刘明. All rights reserved.
//

#import "LMCommentTableViewCell.h"

@interface LMCommentTableViewCell ()

@property (nonatomic, strong) UIImageView *iconView;

@property (nonatomic, strong) UILabel *comentLabel;

@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic, strong) UILabel *timesLabel;

@end

@implementation LMCommentTableViewCell

+ (instancetype)commentTableViewCellWithTableView:(UITableView *)tableView reuserId:(NSString *)reuserId andIndexPath:(NSIndexPath *)indexPath{
    
    
    LMCommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuserId forIndexPath:indexPath];
    
    if (!cell) {
        
        cell = [[LMCommentTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuserId];
    }
    
    return cell;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setupUI];
    }
    
    return self;
}

- (void)setComment:(LMComments *)comment{
    
    _comment = comment;
    
    self.nameLabel.text = comment.user.nickname;
    
    self.comentLabel.text = comment.content;
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:comment.created_at];
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    
    dateFormatter.dateFormat = @"HH:mm:ss";
    
    NSDateFormatter *dateFormatter1 = [NSDateFormatter new];
    
    dateFormatter1.dateFormat = @"YYYY-MM-dd";
   
    NSString *todayString = [dateFormatter1 stringFromDate:[NSDate date]];
    
    NSString *dateString = [dateFormatter1 stringFromDate:date];
    
    if ([todayString isEqualToString:dateString]) {
        
        dateString = [dateFormatter stringFromDate:date];
    }
    
    self.timesLabel.text = dateString;
    
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:comment.user.avatar_url] placeholderImage:[UIImage imageNamed:@"Me_AvatarPlaceholder_75x75_"]];
}

- (void)setupUI{
    
    kWeakSelf(self);
    
    UIImageView *imageView = [[UIImageView alloc] init];
    self.iconView = imageView;
    imageView.userInteractionEnabled = YES;
    imageView.layer.cornerRadius = 20;
    imageView.layer.masksToBounds = YES;
    //    imageView.layer.shouldRasterize = YES;
    //    imageView.layer.rasterizationScale = [UIScreen mainScreen].scale;
    
    [self.contentView addSubview:imageView];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(weakSelf.contentView).with.offset(10);
        make.left.equalTo(weakSelf.contentView).with.offset(20);
        make.width.mas_offset(@40);
        make.height.mas_offset(@40);
        
    }];
    
    UILabel *nameLabel = [[UILabel alloc] init];
    self.nameLabel = nameLabel;
    nameLabel.textColor = [UIColor lightGrayColor];
    nameLabel.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:nameLabel];
    
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(imageView.mas_right).with.offset(5);
        make.top.equalTo(imageView).with.offset(5);
    }];
    
   
    UILabel *comentLabel = [[UILabel alloc] init];
    self.comentLabel = comentLabel;
    comentLabel.textColor = [UIColor lightGrayColor];
    comentLabel.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:comentLabel];
    
    [comentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(imageView.mas_right).with.offset(5);
        make.top.equalTo(nameLabel.mas_bottom).with.offset(10);
    }];
    
    
    UILabel *timeLabel = [[UILabel alloc] init];
    self.timesLabel = timeLabel;
    timeLabel.textColor = [UIColor lightGrayColor];
    timeLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:timeLabel];
    [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(weakSelf.contentView.mas_right).with.offset(-5);
        make.top.equalTo(nameLabel);
    }];
    

}

@end
