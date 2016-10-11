//
//  HomePageHeaderView.m
//  Car4S
//
//  Created by Alta on 16/5/24.
//  Copyright © 2016年 beyondsoft. All rights reserved.
//

#import "HomePageHeaderView.h"
#import "MacroDefine.h"
#import "FontAndColorDefines.h"
#import <Masonry/Masonry.h>
#define kPageNum 2
@interface HomePageHeaderView ()<UIScrollViewDelegate> {
    UIScrollView *_scrollView;
    UIPageControl *_pageControl;

}
@end

@implementation HomePageHeaderView

- (id)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        NSArray * titlesArray = @[@{@"title":@"流量", @"icon":@"header_traffic"}, @{@"title":@"邀约", @"icon":@"header_invitation"}, @{@"title":@"跟进", @"icon":@"header_followUp"},@{@"title":@"流量", @"icon":@"header_traffic"}, @{@"title":@"邀约", @"icon":@"header_invitation"}, @{@"title":@"跟进",@"icon":@"header_followUp"},@{@"title":@"批注", @"icon":@"header_notation"}, @{@"title":@"审批", @"icon":@"header_approval"}, @{@"title":@"回访", @"icon":@"header_returnVisit"}, @{@"title":@"批注", @"icon":@"header_notation"}, @{@"title":@"审批", @"icon":@"header_approval"}, @{@"title":@"回访", @"icon":@"header_returnVisit"}];
        
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectZero];
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.backgroundColor = [UIColor clearColor];
        _scrollView.contentSize = CGSizeMake(kScreenWith*kPageNum,230);
        _scrollView.delegate = self;
        _scrollView.pagingEnabled = YES;
        
        _pageControl = [[UIPageControl alloc]init];
        _pageControl.numberOfPages = kPageNum;
        _pageControl.currentPage = 0;
        _pageControl.currentPageIndicatorTintColor = kColor_orange;
        _pageControl.pageIndicatorTintColor = kColor_lineGray;
        
        __weak typeof(self) weakSelf = self;
        [self addSubview:_scrollView];
        [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(weakSelf);
        }];
        [self addSubview:_pageControl];
        [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(@0);
            make.bottom.equalTo(@8);
            make.width.equalTo(@80);
        }];
        
        CGFloat width = kScreenWith/3;
        CGFloat height = 114;
        for (NSUInteger index = 0; index<titlesArray.count; index++) {
            NSUInteger row = index/6;
            NSUInteger col = index%6;
            UIView *contentView = [[UIView alloc]init];
            contentView.tag = index+100;
            [_scrollView addSubview:contentView];
            [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(_scrollView).offset(row*height);
                make.leading.equalTo(@(col*width));
                make.height.mas_equalTo(height);
                make.width.mas_equalTo(width);
            }];
            NSString *imageName = [[titlesArray objectAtIndex:index] valueForKey:@"icon"];
            NSString *title = [[titlesArray objectAtIndex:index]valueForKey:@"title"];
            UIImage *iconImage = [UIImage imageNamed:imageName];
            UIImageView *imageView = [[UIImageView alloc]init];
            imageView.image = iconImage;
            [contentView addSubview:imageView];
            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(@15);
                make.centerX.equalTo(contentView);
                make.size.mas_equalTo(iconImage.size);
            }];
            
            UILabel *badgeLabel = [[UILabel alloc]init];
            badgeLabel.layer.borderWidth = 0.5;
            badgeLabel.layer.borderColor = [UIColor whiteColor].CGColor;
            badgeLabel.layer.cornerRadius = 7.5;
            badgeLabel.textColor = [UIColor whiteColor];
            badgeLabel.textAlignment = NSTextAlignmentCenter;
            badgeLabel.text = @"6";
            badgeLabel.layer.masksToBounds = YES;
            badgeLabel.backgroundColor = kColor_orange;
            badgeLabel.font = kTextFont12;
            [imageView addSubview:badgeLabel];
            [badgeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.width.height.mas_equalTo(15);
                make.top.equalTo(@5);
                make.trailing.equalTo(@4);
            }];
            
            UILabel *titleLabel = [[UILabel alloc]init];
            titleLabel.font = kTextFont16;
            titleLabel.textColor = kColor_font_gray;
            titleLabel.textAlignment = NSTextAlignmentCenter;
            titleLabel.text = title;
            [contentView addSubview:titleLabel];
            [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(imageView.mas_bottom).offset(8);
                make.centerX.equalTo(imageView);
            }];
            
            UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(homeHeaderItemClick:)];
            [contentView addGestureRecognizer:tapGestureRecognizer];
        }
        UIImageView *vLineImageView = [[UIImageView alloc]init];
        vLineImageView.backgroundColor = kColor_lineGray;
        [self addSubview:vLineImageView];
        [vLineImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(weakSelf);
            make.leading.trailing.equalTo(@0);
            make.height.mas_equalTo(0.5);
        }];
        
    }
    return self;
}

- (void)homeHeaderItemClick:(UITapGestureRecognizer *)gestureRecognizer {
    UIView *containerView = gestureRecognizer.view;
    NSInteger tag = containerView.tag;
    if (_callBack) {
        _callBack(tag);
    }
}

#pragma mark -UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGPoint offset = scrollView.contentOffset;
    NSInteger currentPage = offset.x/kScreenWith;
    _pageControl.currentPage = currentPage;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
