//
//  L_ServiceNormalCell.m
//  Looktm
//
//  Created by mengqingzheng on 2017/5/12.
//  Copyright © 2017年 北京聚集科技有限公司. All rights reserved.
//

#import "ServiceNormalCell.h"

@interface ServiceNormalCell ()

@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, strong) UILabel *label;

@end

@implementation ServiceNormalCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        ViewBorder(self, 0.5, COLOR(235, 235, 235));
        
        self.label = [[UILabel alloc]init];
        self.label.textColor = COLOR(51, 51, 51);
        self.label.font = [UIFont systemFontOfSize:13];
        self.label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.label];
        
        
        self.imgView = [[UIImageView alloc]init];
        [self addSubview:self.imgView];
        
        
        CGSize size = [@"商标注册" sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize: 13]}];
        CGFloat top = (frame.size.height - size.height - kBaseLine(13) - kBaseLine(31)) / 2.0;
        
        [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(top);
            make.centerX.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(kBaseLine(33), kBaseLine(31)));
        }];
        [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.imgView.mas_bottom).offset(kBaseLine(13));
            make.centerX.width.equalTo(self);
        }];
        self.label.text = @"商标注册";
        self.imgView.image = [UIImage imageNamed:@"ser_ser01"];
    }
    return self;
}

@end
