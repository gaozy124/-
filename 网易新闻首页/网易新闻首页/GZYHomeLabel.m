//
//  GZYHomeLabel.m
//  网易新闻首页
//
//  Created by 高志宇 on 16/2/8.
//  Copyright © 2016年 高志宇. All rights reserved.
//

#import "GZYHomeLabel.h"

#define GZYDefaultRed 0.4
#define GZYDefaultGreen 0.5
#define GZYDefaultBlue 0.6

@implementation GZYHomeLabel


-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        self.textColor=[UIColor colorWithRed:GZYDefaultRed green:GZYDefaultGreen blue:GZYDefaultBlue alpha:1.0];
        self.font=[UIFont systemFontOfSize:15];
        self.backgroundColor=[UIColor clearColor];
        self.textAlignment=NSTextAlignmentCenter;
        self.userInteractionEnabled=YES;
    }
    
    return self;
}


-(void)setScale:(CGFloat)scale{
    _scale=scale;
    
    CGFloat red = GZYDefaultRed + (1-GZYDefaultRed)*scale;
    CGFloat green = GZYDefaultGreen + (0-GZYDefaultGreen)*scale;
    CGFloat blue = GZYDefaultBlue + (0-GZYDefaultBlue)*scale;
    
    self.textColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    self.transform = CGAffineTransformMakeScale(1+scale*0.2, 1+scale*0.2);
    
    
}

@end
