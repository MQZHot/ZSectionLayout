//
//  L_ServiceHeaderReusableView.m
//  Looktm
//
//  Created by mengqingzheng on 2017/5/12.
//  Copyright © 2017年 北京聚集科技有限公司. All rights reserved.
//

#import "HeaderReusableView.h"

@implementation HeaderReusableView

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        self.imgView = [[UIImageView alloc]init];
        self.imgView.contentMode = UIViewContentModeCenter;
        [self addSubview:self.imgView];
        [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
        }];
        
    }
    return self;
}

@end
