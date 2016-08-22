//
//  LMProductViewController.m
//  DanTang
//
//  Created by 刘明 on 16/8/4.
//  Copyright © 2016年 刘明. All rights reserved.
//

#import "LMProductViewController.h"
#import "LMProductCollectionViewCell.h"
#import "LMProduct.h"
#import "LMProductDetailViewController.h"
@interface LMProductViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong)  UICollectionView *collectionView;

@property (nonatomic, strong) NSArray *dateArray;

@end

@implementation LMProductViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupCollectionView];
    
    [self getData];
}


- (void)getData{
    
    kWeakSelf(self)
    
    [LMHttpManager loadProductInfo:^(id response, NSError *error) {
       
        weakSelf.dateArray = response;
        [weakSelf.collectionView reloadData];
        
    }];
}
- (void)setupCollectionView {
    
    self.automaticallyAdjustsScrollViewInsets = NO;
  
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight - 64 - 44) collectionViewLayout: flowLayout];
    
    [self.view addSubview:collectionView];
    
    self.collectionView = collectionView;
    collectionView.delegate = self;
    collectionView.dataSource = self;
    
    self.collectionView.showsVerticalScrollIndicator = YES;
    self.collectionView.backgroundColor = LMGlobalColor;
    [self.collectionView registerClass:[LMProductCollectionViewCell class] forCellWithReuseIdentifier:@"LMProductCollectionViewCell"];
    
    flowLayout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    flowLayout.itemSize = CGSizeMake((kScreenWidth - 20)/2 , 245);
    flowLayout.minimumLineSpacing = 10;
    flowLayout.minimumInteritemSpacing = 10;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
 
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.dateArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    LMProductCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LMProductCollectionViewCell" forIndexPath:indexPath];
//    LMProductCollectionViewCell *cell = [LMProductCollectionViewCell initWithCollectionView:collectionView indexPath:indexPath];
    
    cell.product = self.dateArray[indexPath.row];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    LMProduct *product = self.dateArray[indexPath.row];
    [LMHttpManager loadProductDetailInfo:product.id Finished:^(id response, NSError *error) {
        
        LMProductDetailViewController *productDetailVC = [[LMProductDetailViewController alloc] init];
        
        productDetailVC.title = @"商品详情";
        productDetailVC.Id = product.id;
        productDetailVC.productDetail = response;
        
        [self.navigationController pushViewController:productDetailVC animated:YES];
    }];
    

    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
