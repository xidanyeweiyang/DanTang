//
//  LMCommentTableViewCell.h
//  DanTang
//
//  Created by 刘明 on 16/8/10.
//  Copyright © 2016年 刘明. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LMComments.h"
@interface LMCommentTableViewCell : UITableViewCell

+ (instancetype)commentTableViewCellWithTableView:(UITableView *)tableView reuserId:(NSString *)reuserId andIndexPath:(NSIndexPath *)indexPath;

@property (nonatomic, strong) LMComments *comment;

@end
