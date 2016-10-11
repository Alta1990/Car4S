//
//  UILabel+FontColor.m
//  ep2p-app
//
//  Created by john xia on 15/12/15.
//  Copyright © 2015年 WuLeilei. All rights reserved.
//

#import "UILabel+FontColor.h"

@implementation UILabel (FontColor)

- (void)setAttributedTextWithSpecialText:(NSString *)text specialFont:(UIFont *)font SprcialColor:(UIColor *)color
{
    NSDictionary *originalAttribs = @{NSForegroundColorAttributeName:self.textColor,
                                      NSFontAttributeName:self.font};
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:self.text attributes:originalAttribs];
    NSRange specialTextRange = [self.text rangeOfString:text];
    if (specialTextRange.location != NSNotFound) {
        if (font && color) {
            [attributedText setAttributes:@{NSForegroundColorAttributeName:color,NSFontAttributeName:font} range:specialTextRange];
        }else if (font && !color) {
            [attributedText setAttributes:@{NSFontAttributeName:font} range:specialTextRange];
        }else if (!font && color) {
            [attributedText setAttributes:@{NSForegroundColorAttributeName:color} range:specialTextRange];
        }
        
        self.attributedText = attributedText;
    }
}

@end
