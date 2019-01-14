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

#define kSectionInsetLeftRight 16

@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"自定义布局";
    
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
}

- (IBAction)tapButton:(id)sender {
    
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

@end
