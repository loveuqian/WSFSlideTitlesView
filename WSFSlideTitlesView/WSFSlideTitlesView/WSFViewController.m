//
//  WSFViewController.m
//  WSFSlideTitlesView
//
//  Created by WangShengFeng on 3/7/16.
//  Copyright © 2016 WangShengFeng. All rights reserved.
//

#import "WSFViewController.h"
#import "WSFSlideTitlesView.h"

@interface WSFViewController ()

@end

@implementation WSFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor orangeColor];

    [self setupSlideTitlesView];
}

- (void)setupSlideTitlesView
{
    WSFSlideTitlesView *slideTitlesView = [[WSFSlideTitlesView alloc] initWithFrame:CGRectMake(50, 50, 200, 50)];
    slideTitlesView.titlesArr = @[ @"首页", @"消息", @"发现", @"我" ];
    slideTitlesView.overallHeight = 200;
    slideTitlesView.overallWidth = 50;
    slideTitlesView.backgroundColor = [UIColor blueColor];

    [self.view addSubview:slideTitlesView];
}

@end
