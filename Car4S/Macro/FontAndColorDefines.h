//
//  FontAndColorDefines.h
//  Car4S
//
//  Created by Alta on 16/5/24.
//  Copyright © 2016年 beyondsoft. All rights reserved.
//
#import "UIFont+Size.h"

#ifndef FontAndColorDefines_h
#define FontAndColorDefines_h

/*-----颜色定义-----*/
#define COLOR(R, G, B, A)   [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
//橙色
#define kColor_orange COLOR(243.0, 156.0, 17.0, 1.0)
#define kColor_font_gray COLOR(164.0, 164.0, 164.0, 1.0)
#define kColor_font_darkGray COLOR(131.0, 131.0, 131.0, 1.0)
#define kColor_lineGray COLOR(238.0, 238.0, 238.0, 1.0)
#define CG_CellDarkGrayColor [UIColor colorWithRed:0.60f green:0.60f blue:0.60f alpha:1.00f]

/*-----字体定义*/
#define kTextFont12 [UIFont customSize:12]
#define kTextFont14 [UIFont customSize:14]
#define kTextFont15 [UIFont customSize:15]
#define kTextFont16 [UIFont customSize:16]
#define kTextFont18 [UIFont customSize:18]
#define kTextFont20 [UIFont customSize:20]
#endif /* FontAndColorDefines_h */
