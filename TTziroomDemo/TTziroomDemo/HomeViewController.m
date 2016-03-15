//
//  HomeViewController.m
//  TTziroomDemo
//
//  Created by 梁腾 on 16/3/8.
//  Copyright © 2016年 TT. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@property (nonatomic,strong) UIView *backView;

@end



@implementation HomeViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
    
    //去掉背景图片
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    //去掉底部线条
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc]init]];
    //添加背景View
    CGRect backView_frame = CGRectMake(0, -20, [UIScreen mainScreen].bounds.size.width, 64);
    UIView *backView = [[UIView alloc] initWithFrame:backView_frame];
    backView.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0];
    self.backView = backView;
    [self.navigationController.navigationBar addSubview:backView];
    
    //城市选择
    UIButton *cityButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 30, 70, 30)];
    cityButton.backgroundColor = [UIColor blueColor];
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:cityButton.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerBottomLeft cornerRadii:CGSizeMake(5, 5)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = cityButton.bounds;
    maskLayer.path = maskPath.CGPath;
    cityButton.layer.mask = maskLayer;
    [self.backView addSubview:cityButton];
    
    
    //添加搜索框
    UIButton *searchButton = [[UIButton alloc] initWithFrame:CGRectMake(80, 30, [UIScreen mainScreen].bounds.size.width-90, 30)];
    searchButton.backgroundColor = [UIColor redColor];
    UIBezierPath *maskPath1 = [UIBezierPath bezierPathWithRoundedRect:searchButton.bounds byRoundingCorners:UIRectCornerTopRight | UIRectCornerBottomRight cornerRadii:CGSizeMake(5, 5)];
    CAShapeLayer *maskLayer1 = [[CAShapeLayer alloc] init];
    maskLayer1.frame = searchButton.bounds;
    maskLayer1.path = maskPath1.CGPath;
    searchButton.layer.mask = maskLayer1;
    [self.backView addSubview:searchButton];
    
    
}


@end
