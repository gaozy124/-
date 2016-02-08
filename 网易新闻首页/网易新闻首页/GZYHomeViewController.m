//
//  GZYHomeViewController.m
//  网易新闻首页
//
//  Created by 高志宇 on 16/2/7.
//  Copyright © 2016年 高志宇. All rights reserved.
//

#import "GZYHomeViewController.h"
#import "GZYContentViewController.h"
#import "GZYHomeLabel.h"

@interface GZYHomeViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *tittleScrollView;
@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollView;

@end

@implementation GZYHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setupChildVc];
    
    
    [self setupTittle];
    
    [self scrollViewDidEndScrollingAnimation:self.contentScrollView];
    
   
}


-(void)setupTittle{
    
    CGFloat labelH = self.tittleScrollView.frame.size.height;
    CGFloat labelW = 100;
    CGFloat labelY = 0;
    for (NSInteger i=0; i<7; i++) {
        
        CGFloat labelX=labelW*i;
        GZYHomeLabel *label = [[GZYHomeLabel alloc]init];
        label.frame=CGRectMake(labelX, labelY, labelW, labelH);
        label.text=self.childViewControllers[i].title;
        label.tag=i;
        [label addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelClicked:)]];
        [self.tittleScrollView addSubview:label];
        
        if (i == 0) {
            label.scale = 1;
        }
        
    }
    
    self.tittleScrollView.contentSize=CGSizeMake(labelW*7,0);
    self.contentScrollView.contentSize=CGSizeMake([UIScreen mainScreen].bounds.size.width*7,0);

    
}

-(void)setupChildVc{
    GZYContentViewController *content0 = [[GZYContentViewController alloc] init];
    content0.title=@"国际";
    [self addChildViewController:content0];

    GZYContentViewController *content1 = [[GZYContentViewController alloc] init];
    content1.title=@"军事";
    [self addChildViewController:content1];
    GZYContentViewController *content2 = [[GZYContentViewController alloc] init];
    content2.title=@"社会";
    [self addChildViewController:content2];
    GZYContentViewController *content3 = [[GZYContentViewController alloc] init];
    content3.title=@"政治";
    [self addChildViewController:content3];
    GZYContentViewController *content4 = [[GZYContentViewController alloc] init];
    content4.title=@"经济";
    [self addChildViewController:content4];
    GZYContentViewController *content5 = [[GZYContentViewController alloc] init];
    content5.title=@"体育";
    [self addChildViewController:content5];
    GZYContentViewController *content6 = [[GZYContentViewController alloc] init];
    content6.title=@"娱乐";
    [self addChildViewController:content6];
    
}


-(void)labelClicked:(UITapGestureRecognizer *)tap{
    CGPoint offset = CGPointMake(tap.view.tag*self.contentScrollView.frame.size.width, 0);
    
    [self.contentScrollView setContentOffset:offset animated:YES];
}


#pragma mark - <UIScrollViewDelegate>

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    [self scrollViewDidEndScrollingAnimation:scrollView];
}

-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    
    CGFloat width = scrollView.frame.size.width;
    CGFloat height = scrollView.frame.size.height;
    
    
    
    NSInteger index = scrollView.contentOffset.x/scrollView.frame.size.width;
    
    UIViewController *willShowVc = self.childViewControllers[index];
    
    
    GZYHomeLabel *label = self.tittleScrollView.subviews[index];
    
    CGPoint offset = self.tittleScrollView.contentOffset;
    
    offset.x = label.center.x-width/2;
    
    CGFloat maxOffsetX = self.tittleScrollView.contentSize.width-width;
    
    if (offset.x < 0) {
        offset.x = 0;
    }else if (offset.x > maxOffsetX){
        offset.x = maxOffsetX;
    };
    
    
    
    [self.tittleScrollView setContentOffset:offset animated:YES];
    
    for (GZYHomeLabel *otherLabel in self.tittleScrollView.subviews) {
        if (otherLabel != label) {
            otherLabel.scale = 0.0;
        }
    }
    
    
    
    
    if ([willShowVc isViewLoaded]) return;

    
    willShowVc.view.frame=CGRectMake(scrollView.contentOffset.x, 0, width, height);

    
    [scrollView addSubview:willShowVc.view];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    

    CGFloat scale = scrollView.contentOffset.x/scrollView.frame.size.width;
    
    if (scale < 0 || scale > self.tittleScrollView.subviews.count-1) return;
    
    
    NSInteger leftIndex=scale;
    NSInteger rightIndex=leftIndex+1;
    
    CGFloat rightScale = scale-leftIndex;
    CGFloat leftScale = 1 - rightScale;
    
    GZYHomeLabel *leftLabel=self.tittleScrollView.subviews[leftIndex];
    GZYHomeLabel *rightLabel=(rightIndex >= self.tittleScrollView.subviews.count)? nil : self.tittleScrollView.subviews[rightIndex];
    
    leftLabel.scale=leftScale;
    rightLabel.scale=rightScale;
    
    
    

    
    NSLog(@"left-%f,right-%f",leftScale,rightScale);
}

    


@end
