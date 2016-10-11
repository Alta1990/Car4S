//
//  BottomToolBarView.m
//  Car4S
//
//  Created by Alta on 16/5/30.
//  Copyright © 2016年 beyondsoft. All rights reserved.
//

#import "BottomToolBarView.h"
#import "FontAndColorDefines.h"
#import <Masonry/Masonry.h>
#define kLeftAndRightMargin 16
#define kMiddleMargin 6

@interface BottomToolBarView () {
    UIImageView *_praiseImageView;
    UILabel *_praiseLabel;
    UIImageView *_shareImageView;
    UILabel *_shareLabel;
    UIImageView *_collectImageView;
    UILabel *_collectLabel;
    
}

@end

@implementation BottomToolBarView
- (id)initWithImageDictionary:(NSDictionary *)imageDic {
    self = [super init];
    if (self) {
        _praiseImageView = [[UIImageView alloc]init];
        UIImage *praiseImage = [UIImage imageNamed:[imageDic valueForKey:@"first"]];
        _praiseImageView.image = praiseImage;
        [self addSubview:_praiseImageView];
        
        _praiseLabel = [[UILabel alloc]init];
        _praiseLabel.font = kTextFont14;
        _praiseLabel.textColor = UIColorFromRGB(0xFFFFFF);
        _praiseLabel.text = @"254";
        [self addSubview:_praiseLabel];
        
        _shareImageView = [[UIImageView alloc]init];
        UIImage *shareImage = [UIImage imageNamed:[imageDic valueForKey:@"second"]];
        _shareImageView.image = shareImage;
        [self addSubview:_shareImageView];
        
        _shareLabel = [[UILabel alloc]init];
        _shareLabel.font = kTextFont14;
        _shareLabel.textColor = UIColorFromRGB(0xFFFFFF);
        _shareLabel.text = @"53";
        [self addSubview:_shareLabel];
        
        _collectImageView = [[UIImageView alloc]init];
        UIImage *collectImage = [UIImage imageNamed:[imageDic valueForKey:@"third"]];
        _collectImageView.image = collectImage;
        [self addSubview:_collectImageView];
        
        _collectLabel = [[UILabel alloc]init];
        _collectLabel.font = kTextFont14;
        _collectLabel.textColor = UIColorFromRGB(0xF1CABC);
        _collectLabel.text = @"已收藏";
        [self addSubview:_collectLabel];
    
        [_praiseImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(@kLeftAndRightMargin);
            make.top.equalTo(@0);
            make.size.mas_equalTo(praiseImage.size);
        }];
        [_praiseLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(_praiseImageView.mas_trailing).offset(kMiddleMargin);
            make.centerY.equalTo(_praiseImageView);
        }];
        
        [_shareImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(_praiseImageView);
            make.size.mas_equalTo(shareImage.size);
            make.leading.equalTo(_praiseLabel.mas_trailing).offset(39);
        }];
        [_shareLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(_shareImageView.mas_trailing).offset(kMiddleMargin);
            make.centerY.equalTo(_shareImageView);
        }];
        
        [_collectImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(_praiseImageView);
            make.size.mas_equalTo(collectImage.size);
            make.trailing.equalTo(_collectLabel.mas_leading).offset(-kMiddleMargin);
        }];
        [_collectLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.trailing.equalTo(@-kLeftAndRightMargin);
            make.centerY.equalTo(_collectImageView);
        }];
    }
    return  self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
