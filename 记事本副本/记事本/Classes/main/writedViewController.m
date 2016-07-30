//
//  writedViewController.m
//  记事本
//
//  Created by 刘超然 on 16/7/18.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "writedViewController.h"
#import "Masonry.h"
#import "ViewController.h"


@interface writedViewController ()
@property(weak,nonatomic)UITextView * textView;
@end

@implementation writedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    //创建保存按钮
    self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(saveData:)];
    //创建textView
    [self setupUI];
    //接收顺传过来的数据
    self.textView.text =_arrayData.textWrited;
    
}
#pragma mark - 搭建界面
-(void)setupUI{
    UITextView * textView =[[UITextView alloc]init];
    [self.view addSubview:textView];
    [textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
    }];
    
    self.textView =textView;
    //让textView成为第一响应者
    [textView becomeFirstResponder ];
}
#pragma mark - 监听保存按钮
-(void)saveData:(UIBarButtonItem *)sender
{
    //判断回传什么数据回去
    writeText * save;
    if (self.arrayData) {
        self.arrayData.textWrited = self.textView.text;
    }else{
        save = [[writeText alloc]init];
        save.textWrited = self.textView.text;
    }
    //利用block做代理
    if (self.saveBlock) {
        self.saveBlock(save);
    }
    
//    if ([self.delegate respondsToSelector:@selector(writedViewController:andArrayData:)]) {
//        [self.delegate writedViewController:self andArrayData:save];
//    }
    //跳回上一个控制器
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - 键盘问题
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.view endEditing:YES];
}
@end
