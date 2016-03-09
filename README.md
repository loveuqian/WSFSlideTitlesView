# WSFSlideTitlesView

## 自定义标题栏
* 因为本人公司项目中多处用到了这种标题栏，于是就把写好的代码封装起来，方便多次复用

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

* 内部切换按钮通知外部只需实现代理方法

```
- (void)slideTitlesView:(WSFSlideTitlesView *)titlesView
        didSelectButton:(UIButton *)button
                atIndex:(NSUInteger)index
{
    NSLog(@"点击 -第%zd个- -%@- 按钮", index, [button attributedTitleForState:UIControlStateNormal].string);
}
```

* 外部控制内部切换按钮

```
[self.titlesView selectButtonAtIndex:0];
```

## 效果展示
![](http://ww3.sinaimg.cn/large/0060lm7Tgw1f1r1lkdim5g30fg0ri400.gif)

## TODO
* 添加 cocoapods 支持
