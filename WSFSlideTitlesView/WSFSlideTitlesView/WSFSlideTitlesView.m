//
//  WSFSlideTitlesView.m
//  WSFSlideTitlesView
//
//  Created by WangShengFeng on 3/7/16.
//  Copyright © 2016 WangShengFeng. All rights reserved.
//

#import "WSFSlideTitlesView.h"

@interface WSFSlideTitlesView ()

@property (nonatomic, weak) UIButton *selectedButton;

@end

@implementation WSFSlideTitlesView

+ (instancetype)slideTitlesViewWithSetting:(WSFSlideTitlesViewSetting *)setting
{
    return [[self alloc] initWithSetting:setting];
}

- (instancetype)initWithSetting:(WSFSlideTitlesViewSetting *)setting
{
    self = [super initWithFrame:setting.frame];
    if (self) {
        // 设置背景颜色
        self.backgroundColor = setting.backgroundColor;
        
        // 创建按钮
        NSUInteger titlesCount = setting.titlesArr.count;
        CGFloat titlesWidth = setting.frame.size.width / titlesCount;
        CGFloat titlesHeight = setting.frame.size.height;
        for (int i = 0; i < titlesCount; ++i) {
            UIButton *titlesButton = [UIButton buttonWithType:UIButtonTypeSystem];
            [titlesButton setTitle:setting.titlesArr[i] forState:UIControlStateNormal];
            [titlesButton setTitle:setting.selectedTitlesArr[i] forState:UIControlStateSelected];
            [titlesButton setTitleColor:setting.textColor forState:UIControlStateNormal];
            [titlesButton setTitleColor:setting.selectedTextColor forState:UIControlStateSelected];
            [titlesButton addTarget:setting
                             action:@selector(titlesBtnClick:)
                   forControlEvents:UIControlEventTouchUpInside];
            titlesButton.frame = CGRectMake(i * titlesWidth, 0, titlesWidth, titlesHeight);
            [self addSubview:titlesButton];
            
            // 点击第一个按钮
            if (0 == i) {
                [self titlesBtnClick:titlesButton];
            }
        }
    }
    return self;
}

- (void)titlesBtnClick:(UIButton *)button
{
    {
        // 已点击按钮
        NSString *currentString = [self.selectedButton titleForState:UIControlStateNormal];
        NSString *toChangeString = [self.selectedButton titleForState:UIControlStateSelected];
        UIColor *currentColor = [self.selectedButton titleColorForState:UIControlStateNormal];
        UIColor *toChangeColor = [self.selectedButton titleColorForState:UIControlStateSelected];
        
        [self.selectedButton setTitle:toChangeString forState:UIControlStateNormal];
        [self.selectedButton setTitle:currentString forState:UIControlStateSelected];
        [self.selectedButton setTitleColor:toChangeColor forState:UIControlStateNormal];
        [self.selectedButton setTitleColor:currentColor forState:UIControlStateSelected];
    }
    
    {
        // 点击按钮
        NSString *currentString = [button titleForState:UIControlStateNormal];
        NSString *toChangeString = [button titleForState:UIControlStateSelected];
        UIColor *currentColor = [button titleColorForState:UIControlStateNormal];
        UIColor *toChangeColor = [button titleColorForState:UIControlStateSelected];
        
        [button setTitle:toChangeString forState:UIControlStateNormal];
        [button setTitle:currentString forState:UIControlStateSelected];
        [button setTitleColor:toChangeColor forState:UIControlStateNormal];
        [button setTitleColor:currentColor forState:UIControlStateSelected];
    }
    
    // 切换按钮
    self.selectedButton = button;
    
    // 执行代理
    if ([self.delegate respondsToSelector:@selector(slideTitlesView:didSelectButton:)]) {
        [self.delegate slideTitlesView:self didSelectButton:button];
    }
}

@end

@implementation WSFSlideTitlesViewSetting

- (NSArray *)selectedTitlesArr
{
    if (!_selectedTitlesArr) {
        _selectedTitlesArr = self.titlesArr;
    }
    return _selectedTitlesArr;
}

- (UIColor *)backgroundColor
{
    if (!_backgroundColor) {
        _backgroundColor = [UIColor whiteColor];
    }
    return _backgroundColor;
}

- (UIColor *)textColor
{
    if (!_textColor) {
        _textColor = [UIColor blackColor];
    }
    return _textColor;
}

- (UIColor *)selectedTextColor
{
    if (!_selectedTextColor) {
        _selectedTextColor = [UIColor orangeColor];
    }
    return _selectedTextColor;
}

@end
