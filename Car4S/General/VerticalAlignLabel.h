//
//  VerticalAlignLabel.h
//  HKDeals
//
//  Created by virgil on 14-9-23.
//
//

#import <UIKit/UIKit.h>
typedef enum
{
    VerticalAlignmentTop = 0, // default
    VerticalAlignmentMiddle,
    VerticalAlignmentBottom,
} VerticalAlignment;

@interface VerticalAlignLabel : UILabel

@property (nonatomic, readwrite) VerticalAlignment verticalAlignment;

@end
