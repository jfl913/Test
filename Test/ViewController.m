//
//  ViewController.m
//  Test
//
//  Created by LiJunfeng on 15/12/25.
//  Copyright © 2015年 LiJunfeng. All rights reserved.
//

#import "ViewController.h"
#import <Masonry/Masonry.h>
#import "JLCollectionViewHorizontalEdgeLayout.h"
#import "UIColor+Blend.h"

#define kSectionInsetLeftRight 16

@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UIView *bottomView;

@property (nonatomic, strong) UIColor *color1;
@property (nonatomic, strong) UIColor *color2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"自定义布局";
    self.view.backgroundColor = [UIColor yellowColor];
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(180);
        if (@available(iOS 11.0, *)) {
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
        }
        else {
            make.top.equalTo(self.view).with.offset(64);
        }
    }];
    
    [self.view addSubview:self.bottomView];
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.collectionView.mas_bottom).with.offset(16);
        make.left.right.equalTo(self.view);
        if (@available(iOS 11.0, *)) {
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        }
        else {
            make.bottom.equalTo(self.view);
        }
    }];
    
    self.color1 = [UIColor colorWithRed:87 / 255.0 green:96 / 255.0 blue:79 / 255.0 alpha:1];
    self.color2 = [UIColor blueColor];
    
    self.bottomView.backgroundColor = self.color1;
}

- (IBAction)tapButton:(id)sender {
    
}

#pragma mark - Helper Method



#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat contentOffsetX = scrollView.contentOffset.x;
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    
    CGFloat ratio = contentOffsetX * 1.0 / screenWidth;
    UIColor *blendColor = [UIColor jl_blendColor1:self.color1
                                           color2:self.color2
                                            ratio:ratio];
    self.bottomView.backgroundColor = blendColor;
}

#pragma mark - UICollectionViewDelegate

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width = [UIScreen mainScreen].bounds.size.width - 2 * kSectionInsetLeftRight;
    return CGSizeMake(width, 180);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, kSectionInsetLeftRight, 0, kSectionInsetLeftRight);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 5;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 6;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    NSInteger item = indexPath.item;
    switch (item) {
        case 0:
            cell.contentView.backgroundColor = [UIColor redColor];
            break;
        case 1:
            cell.contentView.backgroundColor = [UIColor cyanColor];
            break;
        case 2:
            cell.contentView.backgroundColor = [UIColor yellowColor];
            break;
        case 3:
            cell.contentView.backgroundColor = [UIColor blueColor];
            break;
        case 4:
            cell.contentView.backgroundColor = [UIColor greenColor];
            break;
        case 5:
            cell.contentView.backgroundColor = [UIColor orangeColor];
            break;
        default:
            cell.contentView.backgroundColor = [UIColor magentaColor];
            break;
    }
    return cell;
}

#pragma mark - Accessor

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        JLCollectionViewHorizontalEdgeLayout *layout = [JLCollectionViewHorizontalEdgeLayout new];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        // 加快减速速率。
        _collectionView.decelerationRate = UIScrollViewDecelerationRateFast;
        _collectionView.backgroundColor = [UIColor lightGrayColor];
    }
    return _collectionView;
}

- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [UIView new];
    }
    return _bottomView;
}

@end
