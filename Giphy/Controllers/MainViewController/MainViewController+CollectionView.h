//
//  MainViewController+CollectionView.h
//  Giphy
//
//  Created by Viktar Semianchuk on 8/23/18.
//  Copyright © 2018 Viktar Semianchuk. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController (CollectionView) <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, GiphyCollectionViewLayoutDelegate>

@end
