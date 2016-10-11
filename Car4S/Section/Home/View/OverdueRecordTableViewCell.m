//
//  OverdueRecordTableViewCell.m
//  Car4S
//
//  Created by Alta on 16/5/25.
//  Copyright © 2016年 beyondsoft. All rights reserved.
//

#import "OverdueRecordTableViewCell.h"
#import "MacroDefine.h"
#import "FontAndColorDefines.h"
#import "UILabel+FontColor.h"
#import <Masonry/Masonry.h>

@interface OverdueRecordTableViewCell ()
@property (nonatomic, strong) UILabel *leftLabel;
@property (nonatomic, strong) UILabel *rightLabel;

@end

@implementation OverdueRecordTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.leftLabel];
        [self.leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(@16);
            make.centerY.equalTo(@0);
        }];
        
        [self.contentView addSubview:self.rightLabel];
        [self.rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.trailing.equalTo(@0);
            make.centerY.equalTo(@0);
        }];
    }
    return self;
}

- (UILabel*)leftLabel {
    if (!_leftLabel) {
        _leftLabel = [[UILabel alloc]init];
        _leftLabel.font = kTextFont16;
        _leftLabel.textColor = kColor_font_gray;
    }
    return _leftLabel;
}

- (UILabel*)rightLabel {
    if (!_rightLabel) {
        _rightLabel = [[UILabel alloc]init];
        _rightLabel.font = kTextFont15;
        _rightLabel.textColor = kColor_font_darkGray;
    }
    return _rightLabel;
}

#pragma mark -show data
- (void)setTitle:(NSString *)title{
    _title = title;
    _leftLabel.text = title;
    _rightLabel.text = @"2/15";
    [_rightLabel setAttributedTextWithSpecialText:@"2" specialFont:kTextFont15 SprcialColor:kColor_orange];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
