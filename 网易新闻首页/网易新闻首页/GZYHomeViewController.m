//
//  GZYHomeViewController.m
//  网易新闻首页
//
//  Created by 高志宇 on 16/2/7.
//  Copyright © 2016年 高志宇. All rights reserved.
//

#import "GZYHomeViewController.h"

@interface GZYHomeViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *tittleScrollView;
@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollView;

@end

@implementation GZYHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setupTittle];
    
   
}



-(void)setupTittle{
    
    CGFloat labelH = self.tittleScrollView.frame.size.height;
    CGFloat labelW = 100;
    CGFloat labelY = 0;
    [self.view layoutIfNeeded];
    for (NSInteger i=0; i<7; i++) {
        
        CGFloat labelX=labelW*i;
        UILabel *label = [[UILabel alloc]init];
        label.frame=CGRectMake(labelX, labelY, labelW, labelH);
        label.text=@"国际";
        label.backgroundColor=[UIColor colorWithRed:arc4random_uniform(100)/100.0 green:arc4random_uniform(100)/100.0 blue:arc4random_uniform(100)/100.0 alpha:arc4random_uniform(100)/100.0];
        label.textAlignment=NSTextAlignmentCenter;
        [label addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelClicked:)]];
        label.userInteractionEnabled=YES;
        label.tag=i;
        UIView *view = [[UIView alloc] init];
        view.autoresizingMask=UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        
        view.frame=CGRectMake([UIScreen mainScreen].bounds.size.width*i, 0, self.contentScrollView.frame.size.width, self.contentScrollView.frame.size.height);
        view.backgroundColor=[UIColor colorWithRed:arc4random_uniform(100)/100.0 green:arc4random_uniform(100)/100.0 blue:arc4random_uniform(100)/100.0 alpha:arc4random_uniform(100)/100.0];
        NSLog(@"%@",NSStringFromCGRect(view.frame));
        [self.contentScrollView addSubview:view];
        [self.tittleScrollView addSubview:label];
       
        
    }
    
    self.tittleScrollView.contentSize=CGSizeMake(labelW*7,0);
    self.contentScrollView.contentSize=CGSizeMake([UIScreen mainScreen].bounds.size.width*7,0);

    
}

-(void)setupVc{
    
}


-(void)labelClicked:(UITapGestureRecognizer *)tap{
    CGPoint offset = CGPointMake(tap.view.tag*self.contentScrollView.frame.size.width, 0);
    
    [self.contentScrollView setContentOffset:offset animated:YES];
}


@end
