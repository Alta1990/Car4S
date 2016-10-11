//
//  ReportFormsDetailViewController.m
//  Car4S
//
//  Created by Alta on 16/6/2.
//  Copyright © 2016年 beyondsoft. All rights reserved.
//

#import "ReportFormsDetailViewController.h"
#import "UILabel+LineSpacing.h"

@interface ReportFormsDetailViewController ()

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subTitleLabel;
@property (nonatomic, strong) UIImageView *activityImageView;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UILabel *descriptionLabel;

@end

@implementation ReportFormsDetailViewController

#pragma mark -life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpReportFormsDetailUI];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setUpReportFormsDetailUI {
    [self.view addSubview:self.scrollView];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(@0);
    }];
    
    WS(weakSelf);
    UIView *contentView = [[UIView alloc]init];
    [self.scrollView addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.scrollView);
        make.width.equalTo(weakSelf.scrollView);
    }];
    
    [contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@14);
        make.leading.equalTo(@16);
    }];
    
    [contentView addSubview:self.subTitleLabel];
    [self.subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(weakSelf.titleLabel);
        make.top.equalTo(weakSelf.titleLabel.mas_bottom).offset(10);
    }];
    
    [contentView addSubview:self.activityImageView];
    [self.activityImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.subTitleLabel.mas_bottom).offset(18);
        make.leading.equalTo(@16);
        make.trailing.equalTo(@-16);
        make.height.equalTo(@215);
    }];
    
    [contentView addSubview:self.contentLabel];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.activityImageView.mas_bottom).offset(18);
        make.leading.equalTo(@16);
        make.trailing.equalTo(@-16);
    }];
    
    [contentView addSubview:self.descriptionLabel];
    [self.descriptionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.contentLabel.mas_bottom).offset(20);
        make.leading.equalTo(@16);
        make.trailing.equalTo(@-16);

    }];
    
    [contentView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.descriptionLabel.mas_bottom).offset(5);
    }];
    
}

#pragma mark - delegate

#pragma mark - event response

#pragma mark - getter and setter
- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectZero];
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.backgroundColor = [UIColor clearColor];
    }
    return _scrollView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = kTextFont18;
        _titleLabel.textColor = UIColorFromRGB(0x333333);
        _titleLabel.text = @"8848“巅峰汇”用户俱乐部成立";
    }
    return _titleLabel;
}

- (UILabel *)subTitleLabel {
    if (!_subTitleLabel) {
        _subTitleLabel = [[UILabel alloc]init];
        _subTitleLabel.font = kTextFont12;
        _subTitleLabel.textColor = UIColorFromRGB(0x666666);
        _subTitleLabel.text = @"珠峰活动";
    }
    return _subTitleLabel;
}

- (UIImageView *)activityImageView {
    if (!_activityImageView) {
        _activityImageView = [[UIImageView alloc]init];
        _activityImageView.image = [UIImage imageNamed:@"picture01"];
    }
    return _activityImageView;
}

- (UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc]init];
        _contentLabel.font = kTextFont14;
        _contentLabel.textColor = UIColorFromRGB(0x666666);
        _contentLabel.numberOfLines = 0;
        _contentLabel.text = @"2016年4月19日，在海拔5360的EBC珠峰大本营，8848钛金手机正式宣布成立首个官方用户俱乐部--巅峰汇。著名企业家、登山家王石现场电话连线送上祝福，中国民间无氧登山第一人宋玉江以及现场8848用户代表见证了这一时刻。8848钛金手机的奢侈手机定位是机遇也是挑战，需要创新更需要承担风险的勇气，是近乎完美的产品，希望能有好的市场水电费开始的浪费就死定了分开交水电费开始了的看法就死定了分开就撒旦开了房间,8848钛金手机的奢侈手机定位是机遇也是挑战，需要创新更需要承担风险的勇气，是近乎完美的产品，希望能有好的市场水电费开始的浪费就死定了分开交水电费开始了的看法就死定了分开就撒旦开了房间,8848钛金手机的奢侈手机定位是机遇也是挑战，需要创新更需要承担风险的勇气，是近乎完美的产品，希望能有好的市场水电费开始的浪费就死定了分开交水电费开始了的看法就死定了分开就撒旦开了房间,8848钛金手机的奢侈手机定位是机遇也是挑战，需要创新更需要承担风险的勇气，是近乎完美的产品，希望能有好的市场水电费开始的浪费就死定了分开交水电费开始了的看法就死定了分开就撒旦开了房间";
        [_contentLabel setLabelLineSpacing:5];
    }
    return _contentLabel;
}

- (UILabel *)descriptionLabel {
    if (!_descriptionLabel) {
        _descriptionLabel = [[UILabel alloc]init];
        _descriptionLabel.font = kTextFont14;
        _descriptionLabel.textColor = UIColorFromRGB(0x666666);
        _descriptionLabel.numberOfLines = 0;
        _descriptionLabel.text = @"时间：4/04 00:00 至05/01 18:20\n地点：五道口清华同方创业园\n主办方：8848";
        [_descriptionLabel setLabelLineSpacing:5];
    }
    return _descriptionLabel;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
