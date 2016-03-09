//
//  WSFSlideTitlesView.h
//  WSFSlideTitlesView
//
//  Created by WangShengFeng on 3/7/16.
//  Copyright © 2016 WangShengFeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WSFSlideTitlesView;
@class WSFSlideTitlesViewSetting;

@protocol WSFSlideTitlesViewDelegate <NSObject>

@optional
- (void)slideTitlesView:(WSFSlideTitlesView *)titlesView didSelectButton:(UIButton *)button;

@end

@interface WSFSlideTitlesView : UIView

@property (nonatomic, weak) id<WSFSlideTitlesViewDelegate> delegate;

+ (instancetype)slideTitlesViewWithSetting:(WSFSlideTitlesViewSetting *)setting;
- (instancetype)initWithSetting:(WSFSlideTitlesViewSetting *)setting;

- (void)selectButtonAtIndex:(NSUInteger)index;

@end

@interface WSFSlideTitlesViewSetting : NSObject

@property (nonatomic, strong) NSArray *titlesArr;
@property (nonatomic, strong) NSArray *selectedTitlesArr;

@property (nonatomic, assign) CGRect frame;

@property (nonatomic, strong) UIColor *backgroundColor;

@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) UIColor *selectedTextColor;

@property (nonatomic, assign) CGFloat textFontSize;
@property (nonatomic, assign) CGFloat selectedTextFontSize;

@property (nonatomic, assign) BOOL lineHidden;

@property (nonatomic, assign) CGFloat lineWidth;
@property (nonatomic, assign) CGFloat lineHeight;

@property (nonatomic, strong) UIColor *lineColor;

@property (nonatomic, assign) CGFloat lineBottomSpace;

@end
