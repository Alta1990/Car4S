//
//  CurrentStatisticsTableViewCell.h
//  Car4S
//
//  Created by Alta on 16/5/25.
//  Copyright © 2016年 beyondsoft. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^ItemClick)(NSInteger tag);
@interface CurrentStatisticsTableViewCell : UITableViewCell

@property (nonatomic, strong) ItemClick itemClick;
@end
