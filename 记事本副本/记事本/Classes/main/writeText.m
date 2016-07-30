//
//  writeText.m
//  记事本
//
//  Created by 刘超然 on 16/7/18.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "writeText.h"

@implementation writeText
-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self=[super init]) {
        self.textWrited =[aDecoder decodeObjectForKey:@"textWrited"];
    }
    return self;
}
-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_textWrited forKey:@"textWrited"];
}
@end
