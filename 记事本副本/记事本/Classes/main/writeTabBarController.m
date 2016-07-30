//
//  writeTabBarController.m
//  记事本
//
//  Created by 刘超然 on 16/7/18.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "writeTabBarController.h"
#import "ViewController.h"
#import "animateViewController.h"

@interface writeTabBarController ()

@end

@implementation writeTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray * array =[NSMutableArray array];
    [array addObject:[self loadControlWithClassName:@"ViewController" andTitle:@"记事本" andImageName:nil]];
    [array addObject:[self loadControlWithClassName:@"animateViewController" andTitle:@"动画页面" andImageName:nil]];
//    添加到视图上
    self.viewControllers = array.mutableCopy;
    
    
}
-(UIViewController *)loadControlWithClassName:(NSString *)className andTitle:(NSString *)title andImageName:(NSString *)imageName
{
    Class clz =NSClassFromString(className);
    UIViewController * vc =[[clz alloc]init];
    vc.tabBarItem.title = title;
    vc.navigationItem.title = title;
    vc.tabBarItem.image =[UIImage new];//后期可以修改,暂时用空图片,让文字显示出来
    
    UINavigationController * nav =[[UINavigationController alloc]initWithRootViewController:vc];
    return nav;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
