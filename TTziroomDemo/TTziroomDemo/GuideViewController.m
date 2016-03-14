//
//  GuideViewController.m
//  TTziroomDemo
//
//  Created by 梁腾 on 16/3/9.
//  Copyright © 2016年 TT. All rights reserved.
//

#import "GuideViewController.h"
#import "GuideCollectionCell.h"
#import <Masonry.h>
#import "TabBarViewController.h"


@interface GuideViewController()

@property (nonatomic,strong)UIPageControl *pageControl;
@property (nonatomic,strong)UIButton *startButton;

@end

@implementation GuideViewController


- (instancetype)init{
    
    UICollectionViewFlowLayout *flowlayout = [[UICollectionViewFlowLayout alloc] init];
    flowlayout.itemSize = [UIScreen mainScreen].bounds.size;
    flowlayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowlayout.minimumLineSpacing = 0;
    
    return [super initWithCollectionViewLayout:flowlayout];
}

- (void)viewDidLoad{
    
    [self.collectionView registerClass:[GuideCollectionCell class] forCellWithReuseIdentifier:@"Guide_cell"];
    self.collectionView.bounces = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.pagingEnabled = YES;
    
    //添加page
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    pageControl.numberOfPages = 4;
     [self.view addSubview:pageControl];
    [pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.bottom.equalTo(self.view.mas_bottom).offset(-60);
        make.width.equalTo(@80);
        make.height.equalTo(@30);
    }];
   
    self.pageControl = pageControl;
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
    
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 4;
}

- (GuideCollectionCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    GuideCollectionCell *Cell  = [collectionView dequeueReusableCellWithReuseIdentifier:@"Guide_cell" forIndexPath:indexPath];
    Cell.imageName = [NSString stringWithFormat:@"img%ld",indexPath.row];
    if (indexPath.row == 3){
        self.pageControl.hidden = YES;
        [Cell.contentView addSubview:self.startButton];
                [self.startButton mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.centerX.equalTo(self.view.mas_centerX);
                    make.bottom.equalTo(self.view.mas_bottom).offset(-60);
                    make.width.equalTo(@161);
                    make.height.equalTo(@40);
                }];
    }else{
        [self.startButton removeFromSuperview];
    }
    _pageControl.currentPage = indexPath.row;
    NSLog(@"------%ld",indexPath.row);
    return Cell;
    
}

- (UIButton *)startButton{
    if (_startButton == nil) {
        _startButton = [[UIButton alloc] init];
        [_startButton setBackgroundImage:[UIImage imageNamed:@"guideStart"] forState:UIControlStateNormal];
        [_startButton addTarget:self action:@selector(startBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _startButton;
}


- (void)startBtnClick{
    TabBarViewController *tabBar = [[TabBarViewController alloc] init];
    [UIApplication sharedApplication].keyWindow.rootViewController = tabBar;
}




@end
