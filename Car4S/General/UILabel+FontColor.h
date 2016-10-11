//
//  UILabel+FontColor.h
//  ep2p-app
//
//  Created by john xia on 15/12/15.
//  Copyright © 2015年 WuLeilei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (FontColor)

/**
 *  设置label的attributedText
 *
 *  @param text  需要特别处理的文字
 *  @param font  对应的font
 *  @param color 对应的color
 */
- (void)setAttributedTextWithSpecialText:(NSString *)text specialFont:(UIFont *)font SprcialColor:(UIColor *)color;

@end
