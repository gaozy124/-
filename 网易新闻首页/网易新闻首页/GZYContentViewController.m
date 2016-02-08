//
//  GZYContentViewController.m
//  网易新闻首页
//
//  Created by 高志宇 on 16/2/8.
//  Copyright © 2016年 高志宇. All rights reserved.
//

#import "GZYContentViewController.h"

@interface GZYContentViewController ()

@end

@implementation GZYContentViewController

static NSString *ID = @"content";

-(void)viewDidLoad{
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
    self.tableView.showsVerticalScrollIndicator=NO;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 50;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    cell.textLabel.text= [NSString stringWithFormat:@"%@-%ld",self.title,(long)indexPath.row];
    return cell;
}

@end
