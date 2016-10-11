//
//  MineTableViewCell.m
//  Car4S
//
//  Created by Alta on 16/6/1.
//  Copyright © 2016年 beyondsoft. All rights reserved.
//

#import "MineTableViewCell.h"
#import "UILabel+LineSpacing.h"
#import "FontAndColorDefines.h"
#import "MacroDefine.h"
#import <Masonry/Masonry.h>

@interface MineTableViewCell () {
    UILabel *_label;
}

@end
@implementation MineTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _label = [[UILabel alloc]init];
        _label.font = kTextFont14;
        _label.textColor = UIColorFromRGB(0x666666);
        _label.numberOfLines = 2;
        _label.text = @"8848钛金手机的奢侈手机定位是机遇也是挑战，需要创新更需要承担风险的勇气，是近乎完美的品质苛求8848钛金手机的奢侈手机定位是机遇也是挑战，需要创新更需要承担风险的勇气，是近乎完美的品质苛求8848钛金手机的奢侈手机定位是机遇也是挑战，需要创新更需要承担风险的勇气，是近乎完美的品质苛求8848钛金手机的奢侈手机定位是机遇也是挑战，需要创新更需要承担风险的勇气，是近乎完美的品质苛求";
        [self.contentView addSubview:_label];
        [_label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@10);
            make.leading.equalTo(@16);
            make.trailing.equalTo(@-16);
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
