//
//  MIneViewController.m
//  Car4S
//
//  Created by Alta on 16/5/24.
//  Copyright © 2016年 beyondsoft. All rights reserved.
//

#import "MineViewController.h"
#import "MineTableViewCell.h"
#import "KeychainWrapper.h"
#import <AFNetworking/AFNetworking.h>

@interface MineViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *listData;
@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的";
    AFHTTPSessionManager *sessionMagager = [AFHTTPSessionManager manager];
    sessionMagager.requestSerializer = [AFHTTPRequestSerializer serializer];
    sessionMagager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSMutableDictionary *paras = [[NSMutableDictionary alloc]initWithDictionary:@{
                                                                                  @"sessionID":@"0001FD61A33F8D1940F79AD586A5DBD76073",
                                                                                  @"page":@(1),
                                                                                  @"limit":@(10)}];
    [paras setObject:@"a930214be1bb11e58f900242ac110020" forKey:@"cityId"];
    [sessionMagager POST:@"http://120.24.234.64:8080/niuniu/api/order/orderDelegate.shtml" parameters:paras progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
        NSError *error;
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:&error];
        NSLog(@"%@",error);
        NSLog(@"%@", dic);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
    KeychainWrapper *keychainObj = [[KeychainWrapper alloc]init];
    [keychainObj mySetObject:@"lili" forKey:@"myKey"];
   
    NSLog(@"密码：%@", [keychainObj myObjectForKey:@"myKey"]);
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
    MineTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"ReportFormCell" forIndexPath:indexPath];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 12;
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
        _tableView.rowHeight = 44;
        [_tableView registerClass:[MineTableViewCell class] forCellReuseIdentifier:@"ReportFormCell"];
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
