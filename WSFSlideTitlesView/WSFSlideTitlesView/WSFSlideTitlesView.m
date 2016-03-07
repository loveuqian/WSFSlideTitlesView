//
//  WSFSlideTitlesView.m
//  WSFSlideTitlesView
//
//  Created by WangShengFeng on 3/7/16.
//  Copyright © 2016 WangShengFeng. All rights reserved.
//

#import "WSFSlideTitlesView.h"

@implementation WSFSlideTitlesView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSUInteger titlesCount = self.titlesArr.count;
        CGFloat titlesWidth = frame.size.width / titlesCount;
        CGFloat titlesHeight = frame.size.height;

        for (int i = 0; i < titlesCount; ++i) {
            UIButton *titlesButton = [UIButton buttonWithType:UIButtonTypeCustom];
            [titlesButton setTitle:self.titlesArr[i] forState:UIControlStateNormal];
            [titlesButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            titlesButton.frame = CGRectMake(i * titlesWidth, 0, titlesWidth, titlesHeight);
            [self addSubview:titlesButton];
        }
    }
    return self;
}

@end
