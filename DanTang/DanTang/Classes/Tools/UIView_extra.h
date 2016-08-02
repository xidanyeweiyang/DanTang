
//  Created by 刘明 on 16/7/18.
//  Copyright © 2016年 刘明. All rights reserved.
//

#define vAlertTag    10086

#import <UIKit/UIKit.h>
#import <MBProgressHUD.h>
@interface UIView (UIView)

@property (nonatomic, assign) CGFloat   x;
@property (nonatomic, assign) CGFloat   y;
@property (nonatomic, assign) CGFloat   width;
@property (nonatomic, assign) CGFloat   height;
@property (nonatomic, assign) CGPoint   origin;
@property (nonatomic, assign) CGSize    size;
@property (nonatomic, assign) CGFloat   bottom;
@property (nonatomic, assign) CGFloat   right;
@property (nonatomic, assign) CGFloat   centerX;
@property (nonatomic, assign) CGFloat   centerY;
@property (nonatomic, strong, readonly) UIView *lastSubviewOnX;
@property (nonatomic, strong, readonly) UIView *lastSubviewOnY;

@property (nonatomic, strong)  MBProgressHUD *hud;

/**
 * @brief 移除此view上的所有子视图
 */
- (void)removeAllSubviews;


/**
 *  隐藏HUD提示框
 */

- (void)hiddenHUDMessage;
/**
 *  MBHUD 带菊花转动效果样式跳窗
 *
 *  @param title   弹窗标题
 *  @param message 弹窗内容
 */


- (void) showHUDWithJuhua:(NSString *)message;
/**
 *  MBHUD 样式跳窗
 *
 *  @param title   弹窗标题
 *  @param message 弹窗内容
 */
- (void) showHUDVieMessage:(NSString *)message;

/**
 @brief 弹窗
 @param title 弹窗标题
        message 弹窗信息
 */
+ (void) showAlertView: (NSString*) title andMessage: (NSString *) message;

/**
 *  弹窗
 *
 *  @param title    弹窗标题
 *  @param message  弹窗信息
 *  @param delegate 弹窗代理
 */
+ (void) showAlertView: (NSString*) title
            andMessage: (NSString *) message
          withDelegate: (UIViewController<UIAlertViewDelegate> *) delegate;

@end
