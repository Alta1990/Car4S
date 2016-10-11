//
//  HomePageHeaderView.h
//  Car4S
//
//  Created by Alta on 16/5/24.
//  Copyright © 2016年 beyondsoft. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^ClickCallBack)(NSInteger tag);

@interface HomePageHeaderView : UIView

@property (nonatomic, strong) ClickCallBack callBack;
@end
