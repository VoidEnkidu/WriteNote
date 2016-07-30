//
//  UIViewController+HMSliderMenu.m
//  02-QQ-代码
//
//  Created by HaoYoson on 16/7/11.
//  Copyright © 2016年 HaoYoson. All rights reserved.
//

#import "UIViewController+HMSliderMenu.h"

@implementation UIViewController (HMSliderMenu)

- (writeSlideViewController*)sliderMenuController
{
    // 获取当前控制器的父控制器
    UIViewController* iter = self.parentViewController;
    // 如果这个控制器有值 == yes
    while (iter) {

        if ([iter isKindOfClass:[writeSlideViewController class]]) { // 如果这个控制器是我们自己写的控制器 直接返回 结束方法
            return (writeSlideViewController*)iter;
        }
        else if (iter.parentViewController && iter.parentViewController != iter) { // 如果 当前控制器不是,那么看他的父控制器是不是
            iter = iter.parentViewController;
        }
        else {
            iter = nil;
        }
    }
    return nil;
}

@end
