//
//  L_ServiceLayout.h
//  Looktm
//
//  Created by mengqingzheng on 2017/5/12.
//  Copyright © 2017年 北京聚集科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ServiceLayoutDelegate <NSObject>

@optional;
-(CGFloat)heightOfSectionHeaderForIndexPath:(NSIndexPath *)indexPath;
-(CGFloat)heightOfSectionFooterForIndexPath:(NSIndexPath *)indexPath;

@end

@interface ServiceLayout : UICollectionViewLayout

@property (nonatomic, assign) id<ServiceLayoutDelegate>delegate;

@end
