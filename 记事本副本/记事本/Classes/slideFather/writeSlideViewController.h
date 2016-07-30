//
//  writeSlideViewController.h
//  记事本
//
//  Created by 刘超然 on 16/7/19.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface writeSlideViewController : UIViewController
@property(strong,nonatomic)UIViewController * tabBarController;
@property(strong,nonatomic)UIViewController * leftVC;
-(instancetype)initWithTabBarView:(UIViewController *)tabBarController andLeftController:(UIViewController *)leftController;
@end
