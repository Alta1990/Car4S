//
//  ViewController.h
//  Car4S
//
//  Created by Alta on 16/5/24.
//  Copyright © 2016年 beyondsoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>
#import "FontAndColorDefines.h"
#import "MacroDefine.h"
@interface BaseViewController : UIViewController

- (void)creatLeftButtonItemWithImage:(UIImage *)image selector:(SEL)selector;
- (void)creatRightButtonItemWithImage:(UIImage *)image selector:(SEL)selector;
@end

