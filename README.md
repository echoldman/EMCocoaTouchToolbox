title: EMCocoaTouchToolbox
---
## 介绍
[EMCocoaTouchToolbox](https://github.com/echoldman/EMCocoaTouchToolbox)是我在开发 iOS 项目时，为了方便自己，逐渐积累的一些和 UIView 有关的扩展合集，希望也能够方便大家。因为开始的年代略微久远，都没有采用 ARC，所以，需要在 Xcode 里通过 -fno-objc-arc 参数来编译每个源文件。完全转向 ARC 已经在日程表里。
## 主要功能和用法
### 快速访问 UIView 的 x、y、width、height 属性

```objc
UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
view.x = 20;
view.y = 20;
view.width = 100;
view.height = 100;
```
### 用十六进制的颜色字符串创建 UIColor，不区分大小写

```objc
[UIColor colorWithHexString:@"#2FDDAB"];
```

或者

```objc
[UIColor colorWithHexString:@"2FDDAB"];
```

### 快速创建图片和按钮

UIImage+Drawn 里包含了一系列的用背景色、图片、文字合成一张新的图片的方法；UIButton+ImagedButton 包含用图片快速创建按钮的方法，通常组合使用的方法如下

```objc
UIImage *image = [UIImage imageWithCGColor:[[UIColor grayColor] CGColor] size:CGSizeMake(64, 28)];
image = [image imageWithText:@"OK" font:[UIFont systemFontOfSize:14] textColor:[UIColor whiteColor]];
UIButton *button = [UIButton buttonWithImage:image
                            highlightedImage:nil
                                      target:self
                    selectorForTouchUpInside:@selector(onOK:)];
button.origin = CGPointMake(100, 28);
```

### 利用横向纹理图创建变宽的按钮
通过横向纹理图，这张图具有不变的左端帽、右端帽，中间是一定宽度在横向上被重复复制的纹理。最终的图片由左端帽、右端帽和重复复制的中间部分组成。以下例子用 buttonBackground.png 这个纹理图横向拉伸并绘制了白色的 Go and Pay 的文字（默认居中），然后生成了一个按钮

```objc
UIImage *texture = [UIImage imageNamed:@"buttonBackground.png"];
UIImage *image = [texture stretchedImageWithWidth:280
                                     leftCapWidth:4
                                  middleRectWidth:2
                                    rightCapWidth:4
                                             text:@"Go and Pay"
                                             font:[UIFont systemFontOfSize:18]
                                        textColor:[UIColor whiteColor]];
UIButton *button = [UIButton buttonWithImage:image
                            highlightedImage:nil
                                      target:self
                    selectorForTouchUpInside:@selector(onGoAndPay:)];
```

### 其他的功能
* 快速创建 UIBarButtonItem
* 从一张图片生成圆角的图片
* 为 UIView 添加 index、name 属性。
 