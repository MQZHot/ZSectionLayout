//
//  L_ServiceLayout.m
//  Looktm
//
//  Created by mengqingzheng on 2017/5/12.
//  Copyright © 2017年 北京聚集科技有限公司. All rights reserved.
//

#import "ServiceLayout.h"

@interface ServiceLayout ()

@property (nonatomic, assign) CGFloat totalHeight;
@property (nonatomic, strong) NSMutableArray *attrsArr;
@end

@implementation ServiceLayout

-(void)prepareLayout {
    [super prepareLayout];
    self.totalHeight = 0;
    NSMutableArray *attributesArr = [NSMutableArray array];
    NSInteger sectionCount = [self.collectionView numberOfSections];
    for (int i = 0; i < sectionCount; i++) {
        NSIndexPath *indexP = [NSIndexPath indexPathWithIndex:i];
        UICollectionViewLayoutAttributes *attr = [self layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader atIndexPath:indexP];
        [attributesArr addObject:attr];
        NSInteger itemCount = [self.collectionView numberOfItemsInSection:i];
        for (int j = 0; j < itemCount; j++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:j inSection:i];
            UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:indexPath];
            [attributesArr addObject:attrs];
        }
        UICollectionViewLayoutAttributes *attr1 = [self layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionFooter atIndexPath:indexP];
        [attributesArr addObject:attr1];
    }
    self.attrsArr = [NSMutableArray arrayWithArray:attributesArr];
}
/// contentSize
-(CGSize)collectionViewContentSize {
    return CGSizeMake(self.collectionView.bounds.size.width, self.totalHeight);
}

-(UICollectionViewLayoutAttributes *)layoutAttributesForSupplementaryViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewLayoutAttributes *layoutAttrs = [UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:elementKind withIndexPath:indexPath];
    CGFloat height = 0;
    
    if (elementKind == UICollectionElementKindSectionHeader) {
        if (_delegate != nil && [_delegate respondsToSelector:@selector(heightOfSectionHeaderForIndexPath:)]) {
            height = [_delegate heightOfSectionHeaderForIndexPath:indexPath];
        }
    } else {
        if (_delegate != nil && [_delegate respondsToSelector:@selector(heightOfSectionFooterForIndexPath:)]) {
            height = [_delegate heightOfSectionFooterForIndexPath:indexPath];
        }
    }
    layoutAttrs.frame = CGRectMake(0, self.totalHeight, SCREEN_WIDTH, height);
    self.totalHeight += height;
    return layoutAttrs;
}


-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    return self.attrsArr;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *layoutAttributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    switch (indexPath.section) {
        case 0:
            [self layoutAttributesForServiceLayout:layoutAttributes indexPath:indexPath];
            break;
        case 1:
            [self layoutAttributesForCopyRightlayout:layoutAttributes indexPath:indexPath];
            break;
        case 2:
            [self layoutAttributesForPatentLayout:layoutAttributes indexPath:indexPath];
            break;
        case 3:
            [self layoutAttributesForCaseLayout:layoutAttributes indexPath:indexPath];
            break;
        default:
            break;
    }
    return layoutAttributes;
}
/// 服务
- (void)layoutAttributesForServiceLayout:(UICollectionViewLayoutAttributes *)layoutAttributes indexPath: (NSIndexPath *) indexPath {
    CGFloat y = self.totalHeight;
    if (indexPath.item == 0) {
        layoutAttributes.frame = CGRectMake(0, y, SCREEN_WIDTH, kBaseLine(85));
        self.totalHeight += kBaseLine(85);
    } else {
        if (indexPath.item > 6) { return; }
        long row = (indexPath.item -1) % 3;
        CGFloat width = SCREEN_WIDTH / 3.0;
        layoutAttributes.frame = CGRectMake(row * width, y, width, kBaseLine(100));
        if (indexPath.item == 3 || indexPath.item == [self.collectionView numberOfItemsInSection:indexPath.section] - 1) {
            self.totalHeight += kBaseLine(100);
        }
    }
}
/// 版权
- (void)layoutAttributesForCopyRightlayout:(UICollectionViewLayoutAttributes *)layoutAttributes indexPath: (NSIndexPath *) indexPath {
    CGFloat y = self.totalHeight;
    CGFloat width = SCREEN_WIDTH / 2.0;
    CGFloat height = kBaseLine(160);
    switch (indexPath.item) {
        case 0:
            layoutAttributes.frame = CGRectMake(0, y, width, height);
            break;
        case 1:
            layoutAttributes.frame = CGRectMake(width, y, width, height / 2.0);
            break;
        case 2:
            layoutAttributes.frame = CGRectMake(width, (height / 2.0) + y, width, height / 2.0);
            break;
        default:
            break;
    }
    if (indexPath.item == [self.collectionView numberOfItemsInSection:indexPath.section] - 1) {
        self.totalHeight += height;
    }
}
/// 专利
- (void)layoutAttributesForPatentLayout:(UICollectionViewLayoutAttributes *)layoutAttributes indexPath: (NSIndexPath *) indexPath {
    CGFloat y = self.totalHeight;
    CGFloat height = 0;
    switch (indexPath.item) {
        case 0:
            layoutAttributes.frame = CGRectMake(0, y, SCREEN_WIDTH, kBaseLine(85));
            height = kBaseLine(85);
            break;
        case 1:
            layoutAttributes.frame = CGRectMake(0, y, SCREEN_WIDTH/2.0, kBaseLine(80));
            height = kBaseLine(80);
            break;
        case 2:
            layoutAttributes.frame = CGRectMake(SCREEN_WIDTH/2.0, y, SCREEN_WIDTH/2.0, kBaseLine(80));
            height = kBaseLine(80);
            break;
        default:
            break;
    }
    if (indexPath.item == 0 || indexPath.item == [self.collectionView numberOfItemsInSection:indexPath.section] - 1) {
        self.totalHeight += height;
    }
}
/// 案件
- (void)layoutAttributesForCaseLayout:(UICollectionViewLayoutAttributes *)layoutAttributes indexPath: (NSIndexPath *) indexPath {
    CGFloat y = self.totalHeight;
    switch (indexPath.item) {
        case 0:
            layoutAttributes.frame = CGRectMake(0, y, SCREEN_WIDTH/2.0, kBaseLine(80));
            self.totalHeight += kBaseLine(80);
            break;
        case 1:
            layoutAttributes.frame = CGRectMake(0, y, SCREEN_WIDTH/2.0, kBaseLine(80));
            self.totalHeight += kBaseLine(80);
            break;
        case 2:
            layoutAttributes.frame = CGRectMake(SCREEN_WIDTH/2.0, y - kBaseLine(160), SCREEN_WIDTH/2.0, kBaseLine(160));
            break;
        default:
            break;
    }
}
@end
