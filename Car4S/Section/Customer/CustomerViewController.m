//
//  CustomerViewController.m
//  Car4S
//
//  Created by Alta on 16/5/24.
//  Copyright © 2016年 beyondsoft. All rights reserved.
//

#import "CustomerViewController.h"
#import "BottomToolBarView.h"
#import "CustomerTableViewCell.h"
#import "UILabel+LineSpacing.h"
#import "VerticalAlignLabel.h"
#define kTableViewHeight kScreenHeight-49.0-64.0-50
@interface CustomerViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) BottomToolBarView *bottomBarView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *dateLabel;
@property (nonatomic, strong) UILabel *phoneTypeLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UIImageView *detailImageView;
@end

@implementation CustomerViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpCustomerSubView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)setUpCustomerSubView {
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.title = @"客户";
    self.view.backgroundColor = UIColorFromRGB(0x303030);
    WS(weakSelf);
    
    [self.view addSubview:self.tableView];
    self.tableView.tableHeaderView = self.headerView;
    
   
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.equalTo(@0);
        make.top.equalTo(weakSelf.mas_topLayoutGuide);
        make.height.equalTo([NSNumber numberWithFloat:kTableViewHeight]);
    }];
    
    //详情
    [self.view addSubview:self.scrollView];
    UIView *contentView = [[UIView alloc]init];
    [self.scrollView addSubview:contentView];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.equalTo(@0);
        make.top.equalTo(weakSelf.tableView.mas_bottom);
        make.height.equalTo([NSNumber numberWithFloat:kTableViewHeight-20]);
    }];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.scrollView);
        make.width.equalTo(weakSelf.scrollView);
    }];
    
    [contentView addSubview:self.titleLabel];
    [contentView addSubview:self.dateLabel];
    [contentView addSubview:self.phoneTypeLabel];
    [contentView addSubview:self.detailImageView];
    [contentView addSubview:self.contentLabel];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(@16);
        make.top.equalTo(@14);
    }];
    [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(weakSelf.titleLabel);
        make.top.equalTo(weakSelf.titleLabel.mas_bottom).offset(10);
    }];
    [self.phoneTypeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.dateLabel);
        make.leading.equalTo(weakSelf.dateLabel.mas_trailing).offset(6);
    }];
    [self.detailImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.dateLabel.mas_bottom).offset(18);
        make.leading.equalTo(@16);
        make.trailing.equalTo(@-16);
        make.height.mas_equalTo(200);
    }];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.detailImageView.mas_bottom).offset(18);
        make.leading.equalTo(weakSelf.titleLabel);
        make.width.equalTo(@(kScreenWith-2*16));
    }];
    [contentView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakSelf.contentLabel.mas_bottom).offset(10);
    }];
    [self.view addSubview:self.bottomBarView];
    [self.bottomBarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.equalTo(@0);
        make.bottom.equalTo(weakSelf.view.mas_bottom).offset(-49);
        make.height.mas_equalTo(50);
    }];
}
- (void)showDetailView{
    self.titleLabel.text = @"8848“巅峰汇”用户俱乐部成立";
    self.dateLabel.text = @"2016-4-26";
    self.phoneTypeLabel.text = @"8488手机";
    self.detailImageView.image = [UIImage imageNamed:@"banner_big_detail"];
    self.contentLabel.text = @"2016年4月19日，在海拔5360的EBC珠峰大本营，8848钛金手机正式宣布成立首个官方用户俱乐部--巅峰汇。著名企业家、登山家王石现场电话连线送上祝福，中国民间无氧登山第一人宋玉江以及现场8848用户代表见证了这一时刻。\n\n8848钛金手机的奢侈手机定位是机遇也是挑战，需要创新更需要承担风险的勇气，是近乎完美的产品，希望能有好的市场水电费开始的浪费就死定了分开交水电费开始了的看法就死定了分开就撒旦开了房间,8848钛金手机的奢侈手机定位是机遇也是挑战，需要创新更需要承担风险的勇气，是近乎完美的产品，希望能有好的市场水电费开始的浪费就死定了分开交水电费开始了的看法就死定了分开就撒旦开了房间,8848钛金手机的奢侈手机定位是机遇也是挑战，需要创新更需要承担风险的勇气，是近乎完美的产品，希望能有好的市场水电费开始的浪费就死定了分开交水电费开始了的看法就死定了分开就撒旦开了房间,8848钛金手机的奢侈手机定位是机遇也是挑战，需要创新更需要承担风险的勇气，是近乎完美的产品，希望能有好的市场水电费开始的浪费就死定了分开交水电费开始了的看法就死定了分开就撒旦开了房间";
    [self.contentLabel setLabelLineSpacing:5];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"customerCell";
    CustomerTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[CustomerTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"customerCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 60;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UITableViewHeaderFooterView *footerView = [self.tableView dequeueReusableHeaderFooterViewWithIdentifier:@"footerView"];
    if (!footerView) {
        footerView = [[UITableViewHeaderFooterView alloc]initWithReuseIdentifier:@"footerView"];
        UIImageView *imageView = [[UIImageView alloc]init];
        UIImage *moreImage = [UIImage imageNamed:@"icon_more"];
        moreImage = [UIImage imageWithCGImage:moreImage.CGImage scale:2 orientation:UIImageOrientationDown];
        imageView.image = moreImage;
        [footerView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(footerView);
            make.top.equalTo(@14);
            make.size.mas_equalTo(moreImage.size);
        }];
    }
    return footerView;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    if (scrollView == self.tableView) {
        if (scrollView.frame.size.height >= scrollView.contentSize.height) {
            NSLog(@"滚动视图高度：%lf",scrollView.frame.size.height);
            NSLog(@"滚动视图内容高度：%lf",scrollView.contentSize.height);
            NSLog(@"滚动位置：%lf",scrollView.contentOffset.y);
            if (scrollView.contentOffset.y >= 30.0) {
                [self scrollUpIntroView];
            }
            
        }else {
            if (scrollView.frame.size.height+scrollView.contentOffset.y > scrollView.contentSize.height+30) {
                
                [self scrollUpIntroView];
            }
        }
    }
    
    if (scrollView == self.scrollView) {
        NSLog(@"滚动视图高度：%lf",scrollView.frame.size.height);
        NSLog(@"滚动内容视图高度：%lf",scrollView.contentSize.height);
        NSLog(@"显示区域相对于frame的偏移量：%lf",scrollView.contentOffset.y);
        if (scrollView.contentOffset.y <= -30) {
            [self scrollDownIntroView];
        }
    }
}

#pragma mark - event response
- (void)scrollUpIntroView
{
    [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(@0);
        make.height.equalTo([NSNumber numberWithFloat:kTableViewHeight]);
        make.bottom.equalTo(self.mas_topLayoutGuide);
    }];
    
    
    [UIView animateWithDuration:1.0 animations:^{
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        
        [self showDetailView];
        
    }];
}

- (void)scrollDownIntroView
{
    [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(@0);
        make.height.equalTo([NSNumber numberWithFloat:kTableViewHeight]);
        make.top.equalTo(self.mas_topLayoutGuide);
    }];
    
    
    [UIView animateWithDuration:1.0 animations:^{
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        
    }];
}
#pragma mark - getters and setters
- (BottomToolBarView *)bottomBarView {
    if (!_bottomBarView) {
        _bottomBarView = [[BottomToolBarView alloc]initWithImageDictionary:@{@"first":@"icon_praise_normal", @"second":@"icon_share_normal", @"third":@"icon_collect_highlight"}];
        _bottomBarView.backgroundColor = UIColorFromRGB(0x303030);

    }
    return _bottomBarView;
}
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.tableFooterView = [[UIView alloc]init];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.rowHeight = 125;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}
- (UIView *)headerView {
    if (!_headerView) {
        UIImage *headerImage =[UIImage imageNamed:@"banner_big"];
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWith, kScreenHeight-100-165-64-60)];
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.image = headerImage;
        [_headerView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(@0);
        }];
    }
    return _headerView;
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectZero];
        _scrollView.showsVerticalScrollIndicator = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.backgroundColor = UIColorFromRGB(0x303030);
        _scrollView.delegate = self;
        //_scrollView.pagingEnabled = YES;
    }
    return _scrollView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = kTextFont20;
        _titleLabel.textColor = UIColorFromRGB(0xFFFEFE);
    }
    return _titleLabel;
}

- (UILabel *)dateLabel {
    if (!_dateLabel) {
        _dateLabel = [[UILabel alloc]init];
        _dateLabel.font = kTextFont12;
        _dateLabel.textColor = UIColorFromRGB(0x666666);
    }
    return _dateLabel;
}

- (UILabel *)phoneTypeLabel {
    if (!_phoneTypeLabel) {
        _phoneTypeLabel = [[UILabel alloc]init];
        _phoneTypeLabel.font = kTextFont12;
        _phoneTypeLabel.textColor = UIColorFromRGB(0x1e639a);
    }
    return _phoneTypeLabel;
}

- (UIImageView *)detailImageView {
    if (!_detailImageView) {
        _detailImageView = [[UIImageView alloc]init];
        _detailImageView.image = [UIImage imageNamed:@"banner_big_detail"];
    }
    return _detailImageView;
}

- (UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc]init];
        _contentLabel.font = kTextFont16;
        _contentLabel.textColor = UIColorFromRGB(0xcccccc);
        _contentLabel.numberOfLines = 0;
        _contentLabel.lineBreakMode = NSLineBreakByCharWrapping;
    }
    return _contentLabel;
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
