
//
//  LMLoginViewController.m
//  练习纯手码项目
//
//  Created by 刘明 on 16/8/2.
//  Copyright © 2016年 刘明. All rights reserved.
//

#import "LMLoginViewController.h"

@interface LMLoginViewController ()

@end

@implementation LMLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self setupNav];
    [self setupUI];

}

- (void)setupUI {
    
    kWeakSelf(self);
    
    UIView *backView = [[UIView alloc] init];
    [self.view addSubview:backView];
    backView.backgroundColor = LMGlobalWhiteColor;
    
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.equalTo(weakSelf.view);
        make.top.equalTo(weakSelf.view).with.offset(100);
        make.height.mas_equalTo(@90);
    }];
    
    UILabel *phoneLabel = [[UILabel alloc] init];
    [backView addSubview:phoneLabel];
    phoneLabel.textColor = [UIColor lightGrayColor];
    phoneLabel.text = @"手机号:";
    phoneLabel.font = [UIFont systemFontOfSize:17];

    [phoneLabel setContentHuggingPriority:250 forAxis:UILayoutConstraintAxisHorizontal];
    
    [phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(backView).with.offset(20);
        make.top.equalTo(backView);
        make.width.mas_equalTo(60);
        
    }];

    
    UILabel *lineLabel = [[UILabel alloc] init];
    [backView addSubview:lineLabel];
    lineLabel.backgroundColor = [UIColor lightGrayColor];
    
    [lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(phoneLabel);
        make.right.equalTo(backView).with.offset(-20);
        make.top.equalTo(phoneLabel.mas_bottom);
        make.height.mas_equalTo(@1);
        
    }];
    
    
    UILabel *passwordLabel = [[UILabel alloc] init];
    [backView addSubview:passwordLabel];
    passwordLabel.textColor = [UIColor lightGrayColor];
    passwordLabel.text = @"密   码:";
    passwordLabel.font = [UIFont systemFontOfSize:17];
    
    [passwordLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(lineLabel.mas_bottom);
        make.left.equalTo(phoneLabel);
        make.bottom.equalTo(backView);
        make.height.equalTo(phoneLabel);
        
    }];
    
    
    UITextField *phoneTextField = [[UITextField alloc] init];
    [backView addSubview:phoneTextField];
    phoneTextField.borderStyle = UITextBorderStyleNone;
    phoneTextField.keyboardType = UIKeyboardTypeNumberPad;
    
    [phoneTextField setContentHuggingPriority:1000 forAxis:UILayoutConstraintAxisHorizontal];

    [phoneTextField mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(phoneLabel.mas_right).with.offset(10);
        make.centerY.equalTo(phoneLabel);
        make.right.equalTo(lineLabel);
        make.height.equalTo(phoneLabel);
        
        
    }];
    
    UITextField *passwordTextField = [[UITextField alloc] init];
    [backView addSubview:passwordTextField];
    passwordTextField.borderStyle = UITextBorderStyleNone;
    passwordTextField.keyboardType = UIKeyboardTypeASCIICapable;
    
    [passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(phoneTextField);
        make.centerY.equalTo(passwordLabel);
        make.right.equalTo(lineLabel);
        make.height.equalTo(passwordLabel);
        
        
    }];
    
    
    UIButton *loginBtn = [[UIButton alloc] init];
    [self.view addSubview:loginBtn];
    
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    loginBtn.titleLabel.textColor = LMGlobalWhiteColor;
    loginBtn.titleLabel.font = [UIFont systemFontOfSize:18];
    [loginBtn setBackgroundColor:LMGlobalRedColor];
    [loginBtn addTarget:self action:@selector(didClickLoginBtn) forControlEvents:UIControlEventTouchUpInside];
    
    loginBtn.layer.cornerRadius = 5;
    loginBtn.layer.masksToBounds = YES;
    
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(backView.mas_bottom).with.offset(30);
        make.height.mas_equalTo(@36);
        make.left.equalTo(weakSelf.view).with.offset(20);
        make.right.equalTo(weakSelf.view).with.offset(-20);
    }];
    
    UIButton *forgettBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:forgettBtn];
    
    [forgettBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
//    forgettBtn.titleLabel.textColor = [UIColor grayColor];
    [forgettBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    forgettBtn.titleLabel.font = [UIFont systemFontOfSize:17];
    [forgettBtn addTarget:self action:@selector(didClickForgetBtn) forControlEvents:UIControlEventTouchUpInside];
 
    [forgettBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(loginBtn.mas_bottom).with.offset(15);
        make.height.mas_equalTo(@30);
        make.right.equalTo(loginBtn);
    }];
    
    
    UIView *bottomBackView = [[UIView alloc] init];
    [self.view addSubview:bottomBackView];
    
    [bottomBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.equalTo(weakSelf.view);
        make.top.equalTo(forgettBtn.mas_bottom).with.offset(15);
        make.height.mas_equalTo(@30);
    }];
    
    UILabel *thiedLabel = [[UILabel alloc] init];
    [bottomBackView addSubview:thiedLabel];
    thiedLabel.text = @"使用社交账号登录";
    thiedLabel.font = [UIFont systemFontOfSize:15];
    thiedLabel.textColor = [UIColor lightGrayColor];
    
    [thiedLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.bottom.equalTo(bottomBackView);
        make.centerX.equalTo(bottomBackView);

    }];
    
    UILabel *lineLeft = [[UILabel alloc] init];
    [bottomBackView addSubview:lineLeft];
    lineLeft.backgroundColor = [UIColor lightGrayColor];
    
    [lineLeft mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(bottomBackView).with.offset(20);
        make.right.equalTo(thiedLabel.mas_left).with.offset(-10);
        make.centerY.equalTo(thiedLabel);
        make.height.mas_equalTo(@1);
        
    }];
    
    UILabel *lineRight = [[UILabel alloc] init];
    [bottomBackView addSubview:lineRight];
    lineRight.backgroundColor = [UIColor lightGrayColor];
    
    [lineRight mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(thiedLabel.mas_right).with.offset(10);
        make.right.equalTo(bottomBackView).with.offset(-20);
        make.centerY.equalTo(thiedLabel);
        make.height.mas_equalTo(@1);
        
    }];
    
    
    UIButton *weChatBtn = [[UIButton alloc] init];
    weChatBtn.tag = 1001;
    [self.view addSubview:weChatBtn];
    [weChatBtn setImage:[UIImage imageNamed:@"Share_WeChatSessionIcon_70x70_"] forState:UIControlStateNormal];
    [weChatBtn addTarget:self action:@selector(didClickThirdLoginBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    [weChatBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(thiedLabel.mas_bottom).with.offset(20);
        make.height.width.mas_equalTo(@70);
        make.centerX.equalTo(weakSelf.view);
        
    }];
    weChatBtn.layer.cornerRadius = 35;
    weChatBtn.layer.masksToBounds = YES;
    
    
    UIButton *sinaBtn = [[UIButton alloc] init];
    sinaBtn.tag = 1002;
    [self.view addSubview:sinaBtn];
    [sinaBtn setImage:[UIImage imageNamed:@"Share_WeiboIcon_70x70_"] forState:UIControlStateNormal];
    [sinaBtn addTarget:self action:@selector(didClickThirdLoginBtn:) forControlEvents:UIControlEventTouchUpInside];
 
    [sinaBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(thiedLabel.mas_bottom).with.offset(20);
        make.height.width.mas_equalTo(@70);
        make.right.equalTo(weChatBtn.mas_left).with.offset(-30);

    }];
    sinaBtn.layer.cornerRadius = 35;
    sinaBtn.layer.masksToBounds = YES;
    

    
    UIButton *qqBtn = [[UIButton alloc] init];
    qqBtn.tag = 1003;
    [self.view addSubview:qqBtn];
    [qqBtn setImage:[UIImage imageNamed:@"Share_QQIcon_70x70_"] forState:UIControlStateNormal];
    [qqBtn addTarget:self action:@selector(didClickThirdLoginBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    [qqBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(thiedLabel.mas_bottom).with.offset(20);
        make.height.width.mas_equalTo(@70);
        make.left.equalTo(weChatBtn.mas_right).with.offset(30);
        
    }];
    qqBtn.layer.cornerRadius = 35;
    qqBtn.layer.masksToBounds = YES;
}

- (void)didClickThirdLoginBtn:(UIButton *)sender{
    
    switch (sender.tag) {
        case 1001:
            NSLog(@"微信登录");
            
            break;
        case 1002:
            NSLog(@"sina登录");
            
            break;
        case 1003:
            NSLog(@"qq登录");
            
            break;
        default:
            break;
    }
}
- (void)didClickForgetBtn{
    
    NSLog(@"%s",__FUNCTION__);
}

- (void)didClickLoginBtn{
    
    
}

- (void)setupNav {

    UIBarButtonItem *leftIten = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(didClickLeftItem)];
    UIBarButtonItem *rightIten = [[UIBarButtonItem alloc] initWithTitle:@"注册" style:UIBarButtonItemStylePlain target:self action:@selector(didClickRightItem)];
    
    
    self.navigationItem.leftBarButtonItem = leftIten;
    self.navigationItem.rightBarButtonItem = rightIten;
}

- (void)didClickLeftItem{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)didClickRightItem{
    
    
    
}


@end
