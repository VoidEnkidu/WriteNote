//
//  writedViewController.h
//  记事本
//
//  Created by 刘超然 on 16/7/18.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "writeText.h"
//@class writedViewController;
//@protocol writedViewControllerDelegate <NSObject>
//-(void)writedViewController:(writedViewController * )writedViewController andArrayData:(writeText *)arrayData;
//@end
@interface writedViewController : UIViewController
@property(strong,nonatomic)writeText * arrayData;
//
//@property(weak,nonatomic)id<writedViewControllerDelegate>  delegate;
@property(copy,nonatomic)void (^saveBlock)(writeText *);
@end
