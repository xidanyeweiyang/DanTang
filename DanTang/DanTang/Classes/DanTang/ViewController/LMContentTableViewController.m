//
//  LMContentTableViewController.m
//  DanTang
//
//  Created by 刘明 on 16/8/3.
//  Copyright © 2016年 刘明. All rights reserved.
//

#import "LMContentTableViewController.h"
#import "LMContentTableViewCell.h"
#import "LMDetailViewController.h"
#import "LMItems.h"
#import "LMLoginViewController.h"

@interface LMContentTableViewController ()<LMContentTableViewCellDeleagte>

@property (nonatomic, strong) NSArray *dateArray;

@end

@implementation LMContentTableViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTableView];
   
        
    [self.tableView.mj_header beginRefreshing];

}

- (void)setupTableView{

    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.tableView.rowHeight = 160;
    
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 44, 0);
    
    [self.tableView registerClass:[LMContentTableViewCell class] forCellReuseIdentifier:@"LMContentTableViewCell"];
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshData)];

//    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//        
//        
//        [LMHttpManager loadDanTangTopInfoWithIndex:self.type finish:^(id response, NSError *error) {
//            
//            weakSelf.dateArray = response;
//            
//            [weakSelf.tableView reloadData];
//            
//            [weakSelf.tableView.mj_header endRefreshing];
//            
//        }];
//    }];
//    
//    self.tableView.mj_header.automaticallyChangeAlpha = YES;

}

- (void)refreshData{
    
    [LMHttpManager loadDanTangTopInfoWithIndex:self.type finish:^(id response, NSError *error) {
        
        self.dateArray = response;
        
        [self.tableView reloadData];
        
        [self.tableView.mj_header endRefreshing];
        
    }];

    
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dateArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LMContentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LMContentTableViewCell" forIndexPath:indexPath];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    LMItems *item = self.dateArray[indexPath.row];
    
    cell.item = item;
    
    cell.delegate = self;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    LMDetailViewController *detail = [[LMDetailViewController alloc] init];
    
    detail.title = @"攻略详情";
    
    detail.item = self.dateArray[indexPath.row];
    
    [self.navigationController pushViewController:detail animated:YES];
}

- (void)didClickDanTangCellFavoritorBtn:(UIButton *)button{
    
    LMLoginViewController *login = [[LMLoginViewController alloc] init];
    
    login.title = @"登录";
    
    LMNavigationController *nav = [[LMNavigationController alloc] initWithRootViewController:login];
    
    [self presentViewController:nav animated:YES completion:nil];
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
