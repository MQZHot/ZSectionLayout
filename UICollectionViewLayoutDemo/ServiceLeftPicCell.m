//
//  L_ServiceLeftPicCell.m
//  Looktm
//
//  Created by mengqingzheng on 2017/5/12.
//  Copyright © 2017年 北京聚集科技有限公司. All rights reserved.
//

#import "ServiceLeftPicCell.h"

@interface ServiceLeftPicCell ()

@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, strong) UILabel *label;

@end

@implementation ServiceLeftPicCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        ViewBorder(self, 0.5, COLOR(235, 235, 235));
        
        self.label = [[UILabel alloc]init];
        self.label.textColor = COLOR(51, 51, 51);
        self.label.font = [UIFont systemFontOfSize: 13];
        [self addSubview:self.label];
        
        
        self.imgView = [[UIImageView alloc]init];
        [self addSubview:self.imgView];
        
        
        [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(kBaseLine(25));
            make.centerY.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(kBaseLine(34), kBaseLine(32)));
        }];
        [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.imgView.mas_right).offset(kBaseLine(19));
            make.centerY.equalTo(self);
        }];
        self.label.text = @"商标注册";
        self.imgView.image = [UIImage imageNamed:@"ser_zl02"];
    }
    return self;
}

@end
