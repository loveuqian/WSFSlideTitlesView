//
//  WSFSlideTitlesViewController.m
//  WSFSlideTitlesView
//
//  Created by WangShengFeng on 16/3/7.
//  Copyright © 2016年 WangShengFeng. All rights reserved.
//

#import "WSFSlideTitlesViewController.h"

#import "WSFSlideTitlesView.h"

@interface WSFSlideTitlesViewController () <WSFSlideTitlesViewDelegate>

@end

@implementation WSFSlideTitlesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    WSFSlideTitlesViewSetting *titlesSetting = [[WSFSlideTitlesViewSetting alloc] init];
    titlesSetting.titlesArr = @[ @"首页", @"消息", @"发现", @"我", ];
    titlesSetting.frame = CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, 30);
    
    WSFSlideTitlesView *titlesView = [[WSFSlideTitlesView alloc] initWithSetting:titlesSetting];
    titlesView.delegate = self;
    [self.view addSubview:titlesView];
}

- (void)slideTitlesView:(WSFSlideTitlesView *)titlesView didSelectButton:(UIButton *)button
{
    NSLog(@"点击 -%@- 按钮", [button attributedTitleForState:UIControlStateNormal].string);
}

@end
