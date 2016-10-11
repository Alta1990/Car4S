//
//  UIFont+Size.m
//  ep2p-app
//
//  Created by Conner Wu on 15/12/9.
//  Copyright (c) 2015年 WuLeilei. All rights reserved.
//

#import "UIFont+Size.h"

@implementation UIFont (Size)

+ (UIFont *)customSize:(CGFloat)fontSize {
    return [self systemFontOfSize:fontSize * 1.0];
}
+ (UIFont *)customBoldSize:(CGFloat)fontSize{
    return [self boldSystemFontOfSize:fontSize*1.0];
}
@end
