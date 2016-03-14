//
//  GuideCollectionCell.m
//  TTziroomDemo
//
//  Created by 梁腾 on 16/3/9.
//  Copyright © 2016年 TT. All rights reserved.
//

#import "GuideCollectionCell.h"

@interface GuideCollectionCell()

@property (nonatomic,weak)UIImageView *imgView;
@end



@implementation GuideCollectionCell

- (void)setImageName:(NSString *)imageName{
    _imageName = imageName;
    self.imgView.image = [UIImage imageNamed:_imageName];
    
}


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UIImageView  *imgView = [[UIImageView alloc] init];
        [self.contentView addSubview:imgView];
        self.imgView = imgView;
    }
    return self;
}


- (void)layoutSubviews{
    [super layoutSubviews];
    self.imgView.frame = self.bounds;

}



@end
