//
//  ViewController.m
//  记事本
//
//  Created by 刘超然 on 16/7/18.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "ViewController.h"
#import "writedViewController.h"
#import "ViewCell.h"
#import "writeText.h"

#define kFile     [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"writed.plist"]

@interface ViewController ()
@property(strong,nonatomic)NSMutableArray * array;
@property(strong,nonatomic)writedViewController * vcccc;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //文件解档
    self.array =[NSKeyedUnarchiver unarchiveObjectWithFile:kFile];
    //初始化可变数组(判断是否为空,如果是空的话,那么初始化数组)
    if (!self.array) {
        self.array =[NSMutableArray array];
    }
    
    //注册单元格
    [self.tableView registerClass:[ViewCell class] forCellReuseIdentifier:@"cellid"];
    
    //右上角创建按钮
    self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc]initWithTitle:@"新建" style:UIBarButtonItemStylePlain target:self action:@selector(create:)];
    
    
}
#pragma mark - 监听新建按钮
-(void)create:(UIBarButtonItem *)sender
{
    writedViewController *vc =[[writedViewController alloc]init];
//    vc.delegate = self;
    //利用block做代理
    __weak ViewController * weakSelf =self;
    vc.saveBlock=^(writeText * save){
        if (save){
            [weakSelf.array insertObject:save atIndex:0];
        }
        //文件归档
        [NSKeyedArchiver archiveRootObject:weakSelf.array toFile:kFile];
        //刷新数据
        [weakSelf.tableView reloadData];
    };
    
    [self.navigationController pushViewController:vc animated:YES];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.array.count;
}
#pragma mark - cell内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ViewCell * cell =[tableView dequeueReusableCellWithIdentifier:@"cellid" forIndexPath:indexPath];
    
    cell.textLabel.text =[self.array[indexPath.row] textWrited];
    return cell;
}
#pragma mark - cell点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    writedViewController * vc =[[writedViewController alloc]init];
    vc.arrayData = self.array[indexPath.row];
    
    [self.navigationController pushViewController:vc animated:YES];
}
//代理
//-(void)writedViewController:(writedViewController *)writedViewController andArrayData:(writeText *)arrayData
//{
//    if (arrayData){
//       [self.array insertObject:arrayData atIndex:0];
//   }
//    [self.tableView reloadData];
//}
@end
