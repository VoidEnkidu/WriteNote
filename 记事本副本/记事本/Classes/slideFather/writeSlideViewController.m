//
//  writeSlideViewController.m
//  记事本
//
//  Created by 刘超然 on 16/7/19.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "writeSlideViewController.h"
#import "writeTabBarController.h"

#define Kmiddle (self.leftVC.view.bounds.size.width * 0.5)

@interface writeSlideViewController ()
@property(strong,nonatomic)UITapGestureRecognizer * tap;
@end

@implementation writeSlideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(instancetype)initWithTabBarView:(UIViewController *)tabBarController andLeftController:(UIViewController *)leftController
{
    if (self=[super init]) {
        //添加另外两个控制器的view
        [self.view addSubview:leftController.view];
        [self.view addSubview:tabBarController.view];
        //建立父子关系
        [self addChildViewController:leftController];
        [self addChildViewController:tabBarController];
        //告诉系统,两个子控制器已经添加完毕
        [leftController didMoveToParentViewController:self];
        [tabBarController didMoveToParentViewController:self];
        
        //赋值全局
        self.tabBarController =tabBarController;
        self.leftVC = leftController;
        //添加手势
        [self setGesture];
    }
    return self;
}
#pragma mark - 添加手势
-(void)setGesture{
    //创建手势
    UIPanGestureRecognizer * pan =[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panGesture:)];
    //添加到tabbar的view上
    [self.tabBarController.view addGestureRecognizer:pan];
}
#pragma mark - 监听上方的手势
-(void)panGesture:(UIPanGestureRecognizer *)sender
{
    //获取手指位置
    CGPoint p =[sender translationInView:sender.view];
    //判断当前的状态
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:
            case UIGestureRecognizerStateChanged:
            if (self.tabBarController.view.frame.origin.x + p.x < 0) {
                return;
            }
            //偏移量
            self.tabBarController.view.transform = CGAffineTransformTranslate(self.tabBarController.view.transform, p.x, 0);
            //偏移量清0
            [sender setTranslation:CGPointZero inView:sender.view];
            break;
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateFailed:
            case UIGestureRecognizerStateCancelled:
            if (self.tabBarController.view.frame.origin.x > Kmiddle) {
                [self open];
            }else
            {
                [self close];
            }
        
            break;
            
        default:
            break;
    }
}
#pragma mark - 让tabbar上的view向右移动
-(void)open{
    [UIView animateWithDuration:.2 animations:^{
        self.tabBarController.view.transform =CGAffineTransformMakeTranslation((Kmiddle * 0.5 + Kmiddle), 0);
    }];
    
    //为了让tabbar点一下能回到最左边,需要做一个轻敲手势(利用懒加载的方法)
    if (!_tap) {
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGesture:)];
        [self.tabBarController.view addGestureRecognizer:tap];
        _tap = tap;
    }
    
}
#pragma mark - 关闭tabBarController
-(void)close{
    [UIView animateWithDuration:.2 animations:^{
        self.tabBarController.view.transform = CGAffineTransformIdentity;
    }];
    [self.tabBarController.view removeGestureRecognizer:self.tap];
    //光remove是移除不干净手势的,需要再把它的值赋为空
    self.tap = nil;
}
#pragma mark - 监听open中的轻敲手势
-(void)tapGesture:(UITapGestureRecognizer *)sender
{
    [self close];
}
@end
