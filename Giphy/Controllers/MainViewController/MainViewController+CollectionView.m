//
//  MainViewController+CollectionView.m
//  Giphy
//
//  Created by Viktar Semianchuk on 8/23/18.
//  Copyright © 2018 Viktar Semianchuk. All rights reserved.
//

#import "MainViewController+CollectionView.h"
#import "UIColor+Random.h"

@implementation MainViewController (CollectionView)

//MARK:- UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 200;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor randomColor];
    return cell;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView heightForContentAtIndexPath:(NSIndexPath *)indexPath {
    return 40 + arc4random() % (150 - 40);
}

//MARK:- UICollectionViewDelegate

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//    return CGSizeMake(collectionView.bounds.size.width / 2 - 16 * 3, 40 + arc4random() % (150 - 40));
//}


@end
