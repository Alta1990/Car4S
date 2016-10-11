//
//  UILabel+LineSpacing.m
//  Car4S
//
//  Created by Alta on 16/5/30.
//  Copyright © 2016年 beyondsoft. All rights reserved.
//

#import "UILabel+LineSpacing.h"

@implementation UILabel (LineSpacing)
/**
 *  设置行间距
 *
 *  @param lineSpacing 间距值
 */
- (void)setLabelLineSpacing:(CGFloat)lineSpacing {
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    [paragraphStyle setLineSpacing:lineSpacing];
    [paragraphStyle setAlignment: NSTextAlignmentLeft];
    [paragraphStyle setLineBreakMode:NSLineBreakByTruncatingTail];
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc]initWithString:self.text];
    [attributeString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, self.text.length)];
    self.attributedText = attributeString;
    [self sizeToFit];
}
@end
