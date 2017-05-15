//
//  ViewController.m
//  UICollectionViewLayoutDemo
//
//  Created by mengqingzheng on 2017/5/14.
//  Copyright © 2017年 mengqingzheng. All rights reserved.
//

#import "ViewController.h"
#import "ServiceLayout.h"
#import "ServiceNormalCell.h"
#import "ServiceOnePicCell.h"
#import "ServiceLeftPicCell.h"
#import "ServicePicTwoTitleCell.h"
#import "HeaderReusableView.h"
#import "FooterReusableView.h"
@interface ViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, ServiceLayoutDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"服务";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    ServiceLayout *layout = [[ServiceLayout alloc]init];
    layout.delegate = self;
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64) collectionViewLayout:layout];
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.view addSubview:self.collectionView];
    
    [self.collectionView registerClass:[ServiceNormalCell class] forCellWithReuseIdentifier:@"ServiceNormalCell"];
    [self.collectionView registerClass:[ServiceOnePicCell class] forCellWithReuseIdentifier:@"ServiceOnePicCell"];
    [self.collectionView registerClass:[ServicePicTwoTitleCell class] forCellWithReuseIdentifier:@"ServicePicTwoTitleCell"];
    [self.collectionView registerClass:[ServiceLeftPicCell class] forCellWithReuseIdentifier:@"ServiceLeftPicCell"];
    [self.collectionView registerClass:[HeaderReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ServiceHeaderReusableView"];
    [self.collectionView registerClass:[FooterReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"ServiceFooterReusableView"];
    
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 4;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return section == 0 ? 7 : 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0:
            if (indexPath.item == 0) {
                ServiceOnePicCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ServiceOnePicCell" forIndexPath:indexPath];
                return cell;
            } else {
                ServiceNormalCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ServiceNormalCell" forIndexPath:indexPath];
                return cell;
            }
            break;
        case 1:
            if (indexPath.item == 0) {
                ServicePicTwoTitleCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ServicePicTwoTitleCell" forIndexPath:indexPath];
                return cell;
            } else {
                ServiceLeftPicCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ServiceLeftPicCell" forIndexPath:indexPath];
                return cell;
            }
            break;
        case 2:
            if (indexPath.item == 0) {
                ServiceOnePicCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ServiceOnePicCell" forIndexPath:indexPath];
                return cell;
            } else {
                ServiceLeftPicCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ServiceLeftPicCell" forIndexPath:indexPath];
                return cell;
            }
            break;
        case 3:
            if (indexPath.item == 2) {
                ServicePicTwoTitleCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ServicePicTwoTitleCell" forIndexPath:indexPath];
                return cell;
            } else {
                ServiceLeftPicCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ServiceLeftPicCell" forIndexPath:indexPath];
                return cell;
            }
            break;
        default:
            return [UICollectionViewCell new];
            break;
    }
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if (kind == UICollectionElementKindSectionHeader) {
        HeaderReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"ServiceHeaderReusableView" forIndexPath:indexPath];
        headerView.imgView.image = [UIImage imageNamed:@"ser_b1"];
        return headerView;
    } else {
        FooterReusableView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"ServiceFooterReusableView" forIndexPath:indexPath];
        return footerView;
    }
}

#pragma mark - ServiceLayoutDelegate
-(CGFloat)heightOfSectionFooterForIndexPath:(NSIndexPath *)indexPath {
    return 15;
}
-(CGFloat)heightOfSectionHeaderForIndexPath:(NSIndexPath *)indexPath {
    return 50;
}
@end
