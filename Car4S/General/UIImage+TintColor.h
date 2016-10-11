//
//  UIImage+TintColor.h
//
//
//  Created by Conner Wu.
//  Copyright (c) 2015年 Conner Wu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (TintColor)

- (UIImage *)imageWithTintColor:(UIColor *)tintColor;
- (UIImage *)imageWithGradientTintColor:(UIColor *)tintColor;

/**
 *  color to image
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

@end
