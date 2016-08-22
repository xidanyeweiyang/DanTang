//
//  LMProductDetailViewController.h
//  DanTang
//
//  Created by 刘明 on 16/8/9.
//  Copyright © 2016年 刘明. All rights reserved.
//

#import "LMBaseViewController.h"
#import "LMProduct.h"
#import "LMProductDetail.h"
#import "LMComments.h"
@interface LMProductDetailViewController : LMBaseViewController

@property (nonatomic, strong) LMProductDetail *productDetail;

@property (nonatomic, strong) NSArray *commentArray;

@property (nonatomic, assign) NSInteger Id;
@end
