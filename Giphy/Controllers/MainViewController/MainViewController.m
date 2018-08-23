//
//  MainViewController.m
//  Giphy
//
//  Created by Viktar Semianchuk on 8/23/18.
//  Copyright © 2018 Viktar Semianchuk. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    GiphyCollectionViewLayout *layout = self.collectionView.collectionViewLayout;
    if (layout != nil) {
        layout.delegate = self;
    }
    
    self.presenter = [[MainViewPresenter alloc] init];
    [self.presenter testFunc];
    
}

@end
