//
//  L_ServicePicTwoTitleCell.m
//  Looktm
//
//  Created by mengqingzheng on 2017/5/12.
//  Copyright © 2017年 北京聚集科技有限公司. All rights reserved.
//

#import "ServicePicTwoTitleCell.h"

@interface ServicePicTwoTitleCell ()

@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, strong) UILabel *title;
@property (nonatomic, strong) UILabel *subTitle;

@end


@implementation ServicePicTwoTitleCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        ViewBorder(self, 0.5, COLOR(235, 235, 235));
        self.title = [[UILabel alloc]init];
        self.title.textColor = COLOR(51, 51, 51);
        self.title.font = [UIFont systemFontOfSize:17];
        self.title.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.title];
        
        
        self.subTitle = [[UILabel alloc]init];
        self.subTitle.textColor = COLOR(102, 102, 102);
        self.subTitle.font = [UIFont systemFontOfSize:17];
        self.subTitle.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.subTitle];
        
        self.imgView = [[UIImageView alloc]init];
        [self addSubview:self.imgView];
        
        
        CGSize size = [@"商标注册" sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:17]}];
        CGSize size1 = [@"商标注册" sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:17]}];
        CGFloat top = (frame.size.height - size.height - size1.height - kBaseLine(31) - kBaseLine(44)) / 2.0;
        
        [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(top);
            make.centerX.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(kBaseLine(44), kBaseLine(43)));
        }];
        [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.imgView.mas_bottom).offset(kBaseLine(16));
            make.centerX.width.equalTo(self);
        }];
        [self.subTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.title.mas_bottom).offset(kBaseLine(15));
            make.centerX.width.equalTo(self);
        }];
        self.title.text = @"商标注册";
        self.subTitle.text = @"商标被驳回了怎么办";
        self.imgView.image = [UIImage imageNamed:@"ser_ser01"];
    }
    return self;
}

@end
