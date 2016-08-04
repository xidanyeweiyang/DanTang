//
//  LMContentTableViewCell.h
//  DanTang
//
//  Created by 刘明 on 16/8/3.
//  Copyright © 2016年 刘明. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LMItems.h"

@class LMContentTableViewCellDeleagte;

@protocol LMContentTableViewCellDeleagte <NSObject>

- (void)didClickDanTangCellFavoritorBtn:(UIButton *)button;

@end

@interface LMContentTableViewCell : UITableViewCell

@property (nonatomic, strong) LMItems *item;

@property (nonatomic, weak) id<LMContentTableViewCellDeleagte> delegate;

+ (instancetype)initWithTable:(UITableView *)tableView;

@end
