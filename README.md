# WSFSlideTitlesView

## 自定义标题栏
* 公司项目中多处用到了这种标题栏，于是就把写好的代码封装起来，方便多次复用
* 原理为通过一个保存好样式参数的 setting 对象创建一个 view
* setting 对象内有多种属性可自定义，包括字体样式、横线样式、动画时间等等
* 至少需要设置标题文字和显示尺寸
* 按钮切换时通过代理方法通知控制器
* 控制器亦可通过外部接口修改选中按钮
* 项目内有 demo 可供查看

## 使用方法
* 将 WSFSlideTitlesView 拖入项目中

```
WSFSlideTitlesView.h
WSFSlideTitlesView.m
```

* 创建一个 WSFSlideTitlesSetting

```
WSFSlideTitlesViewSetting *titlesSetting = [[WSFSlideTitlesViewSetting alloc] init];
titlesSetting.titlesArr = @[ @"首页", @"消息", @"发现", @"我", ];
titlesSetting.frame = CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, 30);
```

* 创建一个 WSFSlideTitlesView

```
WSFSlideTitlesView *titlesView = [[WSFSlideTitlesView alloc] initWithSetting:titlesSetting];
titlesView.delegate = self;
self.titlesView = titlesView;
[self.view addSubview:titlesView];
```

* 内部切换按钮通知外部

```
- (void)slideTitlesView:(WSFSlideTitlesView *)titlesView
        didSelectButton:(UIButton *)button
                atIndex:(NSUInteger)index
{
    NSLog(@"选中 -第%zd个- -%@- 按钮", index, [button attributedTitleForState:UIControlStateNormal].string);
}
```

* 外部控制内部切换按钮

```
[self.titlesView selectButtonAtIndex:0];
```

## 效果展示
![](http://ww3.sinaimg.cn/large/0060lm7Tgw1f1r1lkdim5g30fg0ri400.gif)

## TODO
* 增加更多样式自定义属性
* 添加 cocoapods 支持
