//
//  ReportFormTableViewCell.m
//  Car4S
//
//  Created by Alta on 16/6/1.
//  Copyright © 2016年 beyondsoft. All rights reserved.
//

#import "ReportFormTableViewCell.h"
#import "UILabel+LineSpacing.h"
#import "FontAndColorDefines.h"
#import "MacroDefine.h"
#import <Masonry/Masonry.h>

@interface ReportFormTableViewCell (){
    UIImageView *_activityImageView;
    UILabel *_titleLabel;
    UILabel *_contentLabel;
    UIImageView *_addressImageView;
    UILabel *_addressLabel;
    UIImageView *_timeImageView;
    UILabel *_timeLabel;
    UIImageView *_overImageView;
}

@end

@implementation ReportFormTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

        _activityImageView = [[UIImageView alloc]init];
        [self.contentView addSubview:_activityImageView];
        
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = kTextFont18;
        _titleLabel.textColor = UIColorFromRGB(0x333333);
        [self.contentView addSubview:_titleLabel];
        
        _contentLabel = [self createLabel];
        [self.contentView addSubview:_contentLabel];
        
        _addressImageView = [[UIImageView alloc]init];
        [self.contentView addSubview:_addressImageView];
        
        _addressLabel = [self createLabel];
        [self.contentView addSubview:_addressLabel];
       
        _timeImageView = [[UIImageView alloc]init];
        [self.contentView addSubview:_timeImageView];
        
        _timeLabel = [self createLabel];
        [self.contentView addSubview:_timeLabel];
        
        _overImageView = [[UIImageView alloc]init];
        [self.contentView addSubview:_overImageView];
        
        [_activityImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.trailing.top.equalTo(@0);
            make.height.mas_equalTo(215);
        }];
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(@16);
            make.top.equalTo(_activityImageView.mas_bottom).offset(12);
        }];
       
        [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_titleLabel.mas_bottom).offset(14);
            make.leading.equalTo(@16);
//            make.trailing.equalTo(@-16);
//           make.height.equalTo(@40);
            make.width.equalTo(@(kScreenWith-16*2));
        }];
        
        UIImage *addressImage = [UIImage imageNamed:@"icon_address"];
        _addressImageView.image = addressImage;
        [_addressImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_contentLabel.mas_bottom).offset(13);
            make.leading.equalTo(@16);
            make.width.height.mas_equalTo(20);
            //make.size.mas_equalTo(addressImage.size);
        }];
        
        [_addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(_addressImageView);
            make.leading.equalTo(_addressImageView.mas_trailing).offset(7);
        }];
        
        UIImage *timeImage = [UIImage imageNamed:@"icon_time"];
        _timeImageView.image = timeImage;
        [_timeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_addressImageView.mas_bottom).offset(10);
            make.leading.equalTo(_addressImageView);
            make.width.height.mas_equalTo(20);
            //make.size.mas_equalTo(timeImage.size);
        }];
        
        [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(_timeImageView);
            make.leading.equalTo(_timeImageView.mas_trailing).offset(7);
        }];
        
        UIImage *overImage = [UIImage imageNamed:@"icon_over"];
        _overImageView.image = overImage;
        [_overImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_activityImageView.mas_bottom).offset(-42);
            make.trailing.equalTo(@-16);
            make.width.height.mas_equalTo(115);
            //make.size.mas_equalTo(overImage.size);
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
- (void)setActivityType:(NSString *)activityType {

    if (activityType.integerValue == 1) {
       _activityImageView.image = [UIImage imageNamed:@"picture01"];
        _overImageView.hidden = YES;
    }else{
         _activityImageView.image = [UIImage imageNamed:@"picture02"];
        _overImageView.hidden = NO;
    }
    _titleLabel.text = @"硬货大碰撞";
   
    
    _contentLabel.text = @"8848钛金手机的奢侈手机定位是机遇也是挑战，需要创新更需要承担风险的勇气，是近乎完美的品质苛求8848钛金手机的奢侈手机定位是机遇也是挑战，需要创新更需要承担风险的勇气，是近乎完美的品质苛求";
    [_contentLabel setLabelLineSpacing:5.0f];
     _contentLabel.numberOfLines = 2;
    _addressLabel.text = @"北京";
    _timeLabel.text = @"1016.10.01至2016.10.03";
}

#pragma mark - private methods
- (UILabel *)createLabel{
    UILabel *label = [[UILabel alloc]init];
    label.font = kTextFont14;
    label.textColor = UIColorFromRGB(0x666666);
    label.numberOfLines = 2;
    //label.lineBreakMode = NSLineBreakByTruncatingHead;
    return label;
}
@end
