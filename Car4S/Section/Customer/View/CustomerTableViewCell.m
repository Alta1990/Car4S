//
//  CustomerTableViewCell.m
//  Car4S
//
//  Created by Alta on 16/5/30.
//  Copyright © 2016年 beyondsoft. All rights reserved.
//

#import "CustomerTableViewCell.h"
#import "FontAndColorDefines.h"
#import "UILabel+LineSpacing.h"
#import <Masonry/Masonry.h>
#import "MacroDefine.h"
#import "VerticalAlignLabel.h"
@interface CustomerTableViewCell () {
    UILabel *_titleLabel;
    UILabel *_dateLabel;
    UILabel *_phoneTypeLabel;
    UILabel *_contentLabel;
}
@end
@implementation CustomerTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = UIColorFromRGB(0x303030);
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = kTextFont20;
        _titleLabel.textColor = UIColorFromRGB(0xFFFEFE);
        [self.contentView addSubview:_titleLabel];
        
        _dateLabel = [[UILabel alloc]init];
        _dateLabel.font = kTextFont12;
        _dateLabel.textColor = UIColorFromRGB(0x666666);
        [self.contentView addSubview:_dateLabel];
        
        _phoneTypeLabel = [[UILabel alloc]init];
        _phoneTypeLabel.font = kTextFont12;
        _phoneTypeLabel.textColor = UIColorFromRGB(0x1e639a);
        [self.contentView addSubview:_phoneTypeLabel];
        
        _contentLabel = [[VerticalAlignLabel alloc]init];
        _contentLabel.font = kTextFont16;
        _contentLabel.textColor = UIColorFromRGB(0xcccccc);
        _contentLabel.numberOfLines = 2;
        _contentLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        [self.contentView addSubview:_contentLabel];
        
        _titleLabel.text = @"8848“巅峰汇”用户俱乐部成立";
        _dateLabel.text = @"2016-4-26";
        _phoneTypeLabel.text = @"8488手机";
        _contentLabel.text = @"8848钛金手机的奢侈手机定位是机遇也是挑战，需要创新更需要承担风险的勇气，是近乎完美的产品，希望能有好的市场水电费开始的浪费就死定了分开交水电费开始了的看法就死定了分开就撒旦开了房间";
        [_contentLabel setLabelLineSpacing:5.0];
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(@16);
            make.top.equalTo(@14);
        }];
        [_dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(_titleLabel);
            make.top.equalTo(_titleLabel.mas_bottom).offset(10);
        }];
        [_phoneTypeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(_dateLabel.mas_trailing).offset(8);
            make.centerY.equalTo(_dateLabel);
        }];
        
        [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(_titleLabel);
            make.top.equalTo(_dateLabel.mas_bottom).offset(18);
            make.width.mas_equalTo(kScreenWith-2*16);
        }];
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

@end
