//
//  HomePageViewController.m
//  Car4S
//
//  Created by Alta on 16/5/24.
//  Copyright © 2016年 beyondsoft. All rights reserved.
//

#import "HomePageViewController.h"
#import "HomePageHeaderView.h"
#import "CurrentStatisticsTableViewCell.h"
#import "OverdueRecordTableViewCell.h"
#import "TestViewController.h"
#define kOverdueRecordList @[@"流量", @"邀请", @"跟进", @"批注", @"审批", @"回访"]
@interface HomePageViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *homeTableView;
@property (nonatomic, strong) HomePageHeaderView *homeHeaderView;

@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"潜客";
    [self setUpHomePageUI];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setUpHomePageUI {
    [self creatRightButtonItemWithImage:[UIImage imageNamed:@"add"] selector:@selector(addButtonItemClick)];
    __weak typeof(self) weakSelf = self;
    [self.view addSubview:self.homeTableView];
    [self.homeTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.view);
    }];
    
    self.homeHeaderView = [[HomePageHeaderView alloc]init];
    self.homeHeaderView.callBack = ^(NSInteger tag){
        [weakSelf homeHeaderItemClick:tag];
    };
    self.homeHeaderView.frame = CGRectMake(0, 0, kScreenWith, 230);
    [self.view addSubview:self.homeHeaderView];

    self.homeTableView.tableHeaderView = self.homeHeaderView;
}

#pragma mark - lazy loading
- (UITableView*)homeTableView{
    if (!_homeTableView) {
        _homeTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _homeTableView.delegate = self;
        _homeTableView.dataSource = self;
        _homeTableView.showsHorizontalScrollIndicator = NO;
        _homeTableView.showsVerticalScrollIndicator = NO;
        _homeTableView.tableFooterView = [[UIView alloc]init];
    }
    return _homeTableView;
}

#pragma mark - evetn action
- (void)addButtonItemClick {
    NSLog(@"添加按钮");
    TestViewController *testVC = [[TestViewController alloc]init];
    [self presentViewController:testVC animated:YES completion:nil];
}

- (void)homeHeaderItemClick:(NSInteger)tag {
    switch (tag) {
        case 100:
        {
            NSLog(@"流量");
        }
            break;
        case 101:{
            NSLog(@"邀约");
        }
            break;
        case 102:{
            NSLog(@"跟进");
        }
            break;
        case 103:{
            NSLog(@"批注");
        }
            break;
        case 104:{
            NSLog(@"审批");
        }
            break;
        case 105:{
            NSLog(@"回访");
        }
            
        default:
            break;
    }
}

- (void)cellItemClick:(NSInteger)tag {
    switch (tag) {
        case 10:
        {
            NSLog(@"建档");
        }
            break;
        case 110:
        {
            NSLog(@"进店");
        }
            break;
        case 210:
        {
            NSLog(@"订单");
        }
            break;
        case 310:
        {
            NSLog(@"交车");
        }
            break;
            
        default:
            break;
    }
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    return kOverdueRecordList.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        static NSString *cellIdentifier = @"currentStatisticsCell";
        CurrentStatisticsTableViewCell *cell = [self.homeTableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!cell) {
            cell = [[CurrentStatisticsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        WS(weakSelf);
        cell.itemClick = ^(NSInteger tag){
            [weakSelf cellItemClick:tag];
        };
        return cell;
    }
    static NSString *cellIdentifier = @"overdueRecordCell";
    OverdueRecordTableViewCell *cell = [self.homeTableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[OverdueRecordTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
    }
    cell.title = kOverdueRecordList[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 66;
    }else{
        return 50;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 32;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWith, 32)];

    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.textColor = kColor_font_gray;
    titleLabel.font = kTextFont15;
    if (section == 0) {
        titleLabel.text = @"当日统计";
    }else{
        titleLabel.text = @"过期记录";
    }
    [view addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(view);
    }];
    return view;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.homeTableView deselectRowAtIndexPath:indexPath animated:NO];
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
