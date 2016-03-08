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
            
            // 普通状态
            NSDictionary *attDict = @{
                                      NSFontAttributeName : [UIFont systemFontOfSize:setting.textFontSize],
                                      NSForegroundColorAttributeName : setting.textColor,
                                      };
            NSAttributedString *attStr =
            [[NSAttributedString alloc] initWithString:setting.titlesArr[i] attributes:attDict];
            
            // 选中状态
            NSDictionary *selectedAttDict = @{
                                              NSFontAttributeName : [UIFont systemFontOfSize:setting.textFontSize],
                                              NSForegroundColorAttributeName : setting.selectedTextColor,
                                              };
            NSAttributedString *selectedAttStr =
            [[NSAttributedString alloc] initWithString:setting.selectedTitlesArr[i] attributes:selectedAttDict];
            
            [titlesButton setAttributedTitle:attStr forState:UIControlStateNormal];
            [titlesButton setAttributedTitle:selectedAttStr forState:UIControlStateSelected];
            
            titlesButton.frame = CGRectMake(i * titlesWidth, 0, titlesWidth, titlesHeight);
            
            [titlesButton addTarget:setting
                             action:@selector(titlesBtnClick:)
                   forControlEvents:UIControlEventTouchUpInside];
            
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
        NSAttributedString *currentStr = [self.selectedButton attributedTitleForState:UIControlStateNormal];
        NSAttributedString *toChangeStr = [self.selectedButton attributedTitleForState:UIControlStateSelected];
        
        [self.selectedButton setAttributedTitle:toChangeStr forState:UIControlStateNormal];
        [self.selectedButton setAttributedTitle:currentStr forState:UIControlStateSelected];
    }
    
    {
        // 点击按钮
        NSAttributedString *currentStr = [button attributedTitleForState:UIControlStateNormal];
        NSAttributedString *toChangeStr = [button attributedTitleForState:UIControlStateSelected];
        
        [button setAttributedTitle:toChangeStr forState:UIControlStateNormal];
        [button setAttributedTitle:currentStr forState:UIControlStateSelected];
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

- (CGFloat)textFontSize
{
    if (!_textFontSize) {
        _textFontSize = [UIFont systemFontSize];
    }
    return _textFontSize;
}

- (CGFloat)selectedTextFontSize
{
    if (!_selectedTextFontSize) {
        _selectedTextFontSize = self.textFontSize;
    }
    return _selectedTextFontSize;
}

@end
