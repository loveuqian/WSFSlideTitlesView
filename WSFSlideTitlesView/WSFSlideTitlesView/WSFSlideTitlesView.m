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
@property (nonatomic, weak) UIView *lineView;

@property (nonatomic, strong) WSFSlideTitlesViewSetting *setting;

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
        _setting = setting;
        // 设置背景颜色
        self.backgroundColor = setting.backgroundColor;
        
        // 创建按钮
        NSUInteger titlesCount = setting.titlesArr.count;
        CGFloat titlesWidth = setting.frame.size.width / titlesCount;
        CGFloat titlesHeight = setting.frame.size.height;
        for (int i = 0; i < titlesCount; ++i) {
            // type 修改为 UIButtonTypeCustom 则没有高亮时的变化
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
            
            [titlesButton addTarget:self
                             action:@selector(titlesBtnClick:)
                   forControlEvents:UIControlEventTouchUpInside];
            
            [self addSubview:titlesButton];
            
            // 第一个按钮
            if (0 == i) {
                [self titlesBtnClick:titlesButton];
                
                //                 创建底部横线
                if (!setting.lineHidden) {
                    UIView *lineView;
                    if (setting.lineWidth) {
                        lineView =
                        [[UIView alloc] initWithFrame:CGRectMake(0, 0, setting.lineWidth, setting.lineHeight)];
                    }
                    else {
                        [titlesButton.titleLabel sizeToFit];
                        lineView =
                        [[UIView alloc] initWithFrame:CGRectMake(0, 0, titlesButton.titleLabel.frame.size.width,
                                                                 setting.lineHeight)];
                    }
                    lineView.backgroundColor = setting.lineColor;
                    lineView.center = CGPointMake((setting.frame.size.width / setting.titlesArr.count) / 2,
                                                  setting.frame.size.height - setting.lineBottomSpace);
                    self.lineView = lineView;
                    [self addSubview:lineView];
                }
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
    
    // 移动横线
    if (!self.setting.lineHidden) {
        [UIView animateWithDuration:0.25
                         animations:^{
                             if (self.setting.lineWidth) {
                                 self.lineView.frame = CGRectMake(self.lineView.frame.origin.x,
                                                                  self.lineView.frame.origin.y, self.setting.lineWidth, self.setting.lineHeight);
                             }
                             else {
                                 self.lineView.frame
                                 = CGRectMake(self.lineView.frame.origin.x, self.lineView.frame.origin.y,
                                              button.titleLabel.frame.size.width, self.setting.lineHeight);
                             }
                             self.lineView.center = CGPointMake(button.center.x, self.lineView.center.y);
                         }];
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

- (BOOL)lineHidden
{
    if (!_lineHidden) {
        _lineHidden = NO;
    }
    return _lineHidden;
}

- (CGFloat)lineHeight
{
    if (!_lineHeight) {
        _lineHeight = 1;
    }
    return _lineHeight;
}

- (UIColor *)lineColor
{
    if (!_lineColor) {
        _lineColor = self.selectedTextColor;
    }
    return _lineColor;
}

- (CGFloat)lineBottomSpace
{
    if (!_lineBottomSpace) {
        _lineBottomSpace = 1;
    }
    return _lineBottomSpace;
}

@end
