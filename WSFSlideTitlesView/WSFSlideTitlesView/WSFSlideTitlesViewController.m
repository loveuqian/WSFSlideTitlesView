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

@property (nonatomic, weak) WSFSlideTitlesView *titlesView;

@end

@implementation WSFSlideTitlesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self createWSFSlideTitlesView];
    
    [self createSelectButton];
}

- (void)createWSFSlideTitlesView
{
    WSFSlideTitlesViewSetting *titlesSetting = [[WSFSlideTitlesViewSetting alloc] init];
    titlesSetting.titlesArr = @[ @"首页", @"消息", @"发现", @"我", ];
    titlesSetting.frame = CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, 30);
    
    WSFSlideTitlesView *titlesView = [[WSFSlideTitlesView alloc] initWithSetting:titlesSetting];
    titlesView.delegate = self;
    self.titlesView = titlesView;
    [self.view addSubview:titlesView];
}

- (void)createSelectButton
{
    UIButton *selectButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [selectButton setTitle:@"选中第 0 个按钮" forState:UIControlStateNormal];
    [selectButton addTarget:self action:@selector(selectButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [selectButton sizeToFit];
    selectButton.center
    = CGPointMake([UIScreen mainScreen].bounds.size.width / 2, [UIScreen mainScreen].bounds.size.height / 2);
    
    [self.view addSubview:selectButton];
}

- (void)selectButtonClick
{
    [self.titlesView selectButtonAtIndex:0];
}

- (void)slideTitlesView:(WSFSlideTitlesView *)titlesView didSelectButton:(UIButton *)button
{
    //    NSLog(@"点击 -%@- 按钮", [button attributedTitleForState:UIControlStateNormal].string);
}

@end
