//
//  TabBarViewController.m
//  TTziroomDemo
//
//  Created by 梁腾 on 16/3/8.
//  Copyright © 2016年 TT. All rights reserved.
//

#import "TabBarViewController.h"
#import "HomeViewController.h"
#import "FindRoomViewController.h"
#import "ServiceViewController.h"
#import "LifeViewController.h"
#import "ProfileViewController.h"

@interface TabBarViewController ()

@end


@implementation TabBarViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    [self addChildViewController:@"HomeViewController" title:@"首页" imageName:@"tabbar_compose_button" selectImageName:@"tabbar_compose_button_highlighted"];
    [self addChildViewController:@"FindRoomViewController" title:@"找房" imageName:@"tabbar_discover" selectImageName:@"tabbar_discover_selected"];
    [self addChildViewController:@"ServiceViewController" title:@"服务" imageName:@"tabbar_message_center" selectImageName:@"tabbar_message_center_selected"];
    [self addChildViewController:@"LifeViewController" title:@"生活" imageName:@"tabbar_home" selectImageName:@"tabbar_home_selected"];
    [self addChildViewController:@"ProfileViewController" title:@"我" imageName:@"tabbar_profile" selectImageName:@"tabbar_profile_selected"];
    
    UIView * mView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 48)];//这是整个tabbar的颜色
    [mView setBackgroundColor:[UIColor whiteColor]];
    [self.tabBar insertSubview:mView atIndex:1];
    mView.alpha=0.6;
    
}


//添加子控制器
- (void)addChildViewController:(NSString *)childController title:(NSString *)title imageName:(NSString *)imageName selectImageName:(NSString *)selectImageName{
    
    Class cls = NSClassFromString(childController);
    UIViewController *vc = [[cls alloc] init];
    vc.title = title;
    vc.tabBarItem.image = [[UIImage imageNamed:imageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectImageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //tabBarItem字体的设置
    //正常状态
    NSMutableDictionary *normalText = [NSMutableDictionary dictionary];
    normalText[NSForegroundColorAttributeName] = [UIColor colorWithRed:123/255.0 green:123/255.0 blue:123/255.0 alpha:1.0];
    [vc.tabBarItem setTitleTextAttributes:normalText forState:UIControlStateNormal];
    //选中状态
    NSMutableDictionary *selectedText = [NSMutableDictionary dictionary];
    selectedText[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [vc.tabBarItem setTitleTextAttributes:selectedText forState:UIControlStateSelected];
    //添加导航
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
    
}



@end
