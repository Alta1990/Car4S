//
//  CurrentStatisticsTableViewCell.m
//  Car4S
//
//  Created by Alta on 16/5/25.
//  Copyright © 2016年 beyondsoft. All rights reserved.
//

#import "CurrentStatisticsTableViewCell.h"
#import "FontAndColorDefines.h"
#import "MacroDefine.h"
#import <Masonry/Masonry.h>
#import "UILabel+FontColor.h"
#import "UIImage+TintColor.h"
#define kTitle_array @[@"建档",@"进店",@"订单",@"交车"]

@implementation CurrentStatisticsTableViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGFloat width = kScreenWith/kTitle_array.count;
//        __weak typeof(self) weakSelf = self;
        for (NSUInteger i =0; i<kTitle_array.count; i++) {
            UIView *containerView = [[UIView alloc]init];
            containerView.tag = 15+i;
            [self.contentView addSubview:containerView];
            [containerView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.bottom.equalTo(@0);
                make.width.mas_equalTo(width);
                make.leading.equalTo(@(i*width));
            }];
            
            UILabel *numLabel = [[UILabel alloc]init];
            numLabel.textColor = kColor_font_gray;
            numLabel.font = kTextFont12;
            numLabel.text = @"1/12";
            [numLabel setAttributedTextWithSpecialText:@"1" specialFont:kTextFont16 SprcialColor:kColor_font_gray];
            numLabel.textAlignment = NSTextAlignmentCenter;
            [containerView addSubview:numLabel];
            [numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(containerView);
                make.top.equalTo(@12);
                
            }];
            
            UILabel *desLabel = [[UILabel alloc]init];
            desLabel.textColor = kColor_font_gray;
            desLabel.font = kTextFont16;
            desLabel.textAlignment = NSTextAlignmentCenter;
            desLabel.text = [kTitle_array objectAtIndex:i];
            [containerView addSubview:desLabel];
            [desLabel  mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(containerView);
                make.bottom.equalTo(@-12);
            }];
            
            UIImageView *vLineImageView = [[UIImageView alloc]init];
            vLineImageView.backgroundColor = kColor_lineGray;
            [containerView addSubview:vLineImageView];
            [vLineImageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(@6);
                make.width.mas_equalTo(0.5);
                make.bottom.equalTo(@-8);
                make.trailing.equalTo(containerView.mas_trailing);
            }];
            UIButton *clickButton = [UIButton buttonWithType:UIButtonTypeCustom];
            clickButton.tag = i*100+10;
            [clickButton setBackgroundImage:[UIImage imageWithColor:kColor_lineGray]forState:UIControlStateHighlighted];
            [clickButton addTarget:self action:@selector(itemClick:) forControlEvents:UIControlEventTouchUpInside];
            [containerView addSubview:clickButton];
            [clickButton mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(containerView);
            }];
//            UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(itemClick:)];
//            [containerView addGestureRecognizer:tapGestureRecognizer];
        }
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)itemClick:(id)sender{
    UIButton *btn = (UIButton *)sender;
    if (_itemClick) {
        _itemClick(btn.tag);
    }
}

@end
