//
//  LMProductCollectionViewCell.h
//  DanTang
//
//  Created by 刘明 on 16/8/5.
//  Copyright © 2016年 刘明. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LMProduct.h"
@interface LMProductCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) LMProduct *product;
//+ (instancetype)initWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexpath;

@end
