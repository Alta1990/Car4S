//
//  MacroDefine.h
//  Car4S
//
//  Created by Alta on 16/5/24.
//  Copyright © 2016年 beyondsoft. All rights reserved.
//

#ifndef MacroDefine_h
#define MacroDefine_h

#define WS(weakSelf) __weak __typeof(&*self) weakSelf = self;
#define kScreenWith [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#endif /* MacroDefine_h */
