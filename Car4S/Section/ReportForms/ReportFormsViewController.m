//
//  ReportFormsViewController.m
//  Car4S
//
//  Created by Alta on 16/5/24.
//  Copyright © 2016年 beyondsoft. All rights reserved.
//

#import "ReportFormsViewController.h"
#import "ReportFormsDetailViewController.h"
#import "ReportFormTableViewCell.h"

@interface ReportFormsViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *listData;
@end

@implementation ReportFormsViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"巅峰特权";
    [self setUpReportFormsUI];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setUpReportFormsUI {
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(@0);
    }];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.listData.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

#pragma mark - UITableViewDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ReportFormTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"ReportFormCell" forIndexPath:indexPath];
    cell.activityType = [self.listData objectAtIndex:indexPath.section];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 12;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    ReportFormsDetailViewController *reportFormsDetailVC = [[ReportFormsDetailViewController alloc]init];
    [self.navigationController pushViewController:reportFormsDetailVC animated:YES];
}

#pragma mark - event response

#pragma mark - getter and setters
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.tableFooterView = [[UIView alloc]init];
        _tableView.rowHeight = 378;
        [_tableView registerClass:[ReportFormTableViewCell class] forCellReuseIdentifier:@"ReportFormCell"];
    }
    return _tableView;
}
- (NSArray *)listData {
    if (!_listData) {
        _listData = @[@"1",@"2",@"2",@"1"];
    }
    return _listData;
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
