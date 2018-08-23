//
//  GiphyCollectionViewLayout.m
//  Giphy
//
//  Created by Viktar Semianchuk on 8/23/18.
//  Copyright © 2018 Viktar Semianchuk. All rights reserved.
//

#import "GiphyCollectionViewLayout.h"

@interface GiphyCollectionViewLayout ()

@property (assign, nonatomic) NSUInteger numberOfColumns;
@property (assign, nonatomic) CGFloat cellPadding;
@property (nonatomic) NSMutableArray<UICollectionViewLayoutAttributes *> *cache;
@property (assign, nonatomic) CGFloat contentHeight;
@property (assign, nonatomic) CGFloat contentWidth;
@property (assign, nonatomic, readonly) CGSize collectionViewContentSize;

@end

@implementation GiphyCollectionViewLayout

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.numberOfColumns = 2;
        self.cellPadding = 6;
        self.cache = [[NSMutableArray alloc] init];
        self.contentHeight = 0;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.numberOfColumns = 2;
        self.cellPadding = 6;
        self.cache = [[NSMutableArray alloc] init];
        self.contentHeight = 0;
    }
    return self;
}

- (CGFloat)contentWidth {
    if (self.collectionView != nil) {
        UIEdgeInsets insets = self.collectionView.contentInset;
        return self.collectionView.bounds.size.width - (insets.left + insets.right);
    } else {
        return 0.0;
    }
}

- (CGSize)collectionViewContentSize {
    return CGSizeMake(self.contentWidth, self.contentHeight);
}

- (void)prepareLayout {
    if (self.cache.count != 0 || self.collectionView == nil) {
        return;
    } else {
        CGFloat columnWidth = self.contentWidth / self.numberOfColumns;
        NSMutableArray<NSNumber *> *xOffset = [[NSMutableArray alloc] init];
        for (int i = 0; i < [self.collectionView numberOfItemsInSection:0]; i++) {
            CGFloat value = i * columnWidth;
            [xOffset addObject:[NSNumber numberWithFloat:value]];
        }
        
        int column = 0;
        NSMutableArray<NSNumber *> *yOffset = [[NSMutableArray alloc] init];
        for (int i = 0; i < self.numberOfColumns; i++) {
            [yOffset addObject:[NSNumber numberWithFloat:0.0]];
        }
        
        for (int i = 0; i < [self.collectionView numberOfItemsInSection:0]; i++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
            
            CGFloat currentContentHeight = [self.delegate collectionView:self.collectionView heightForContentAtIndexPath:indexPath];
            CGFloat height = self.cellPadding * 2 + currentContentHeight;
            CGRect frame = CGRectMake(xOffset[column].floatValue, yOffset[column].floatValue, columnWidth, height);
            CGRect insetFrame = CGRectInset(frame, self.cellPadding, self.cellPadding);
            
            UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
            attributes.frame = insetFrame;
            [self.cache addObject:attributes];
            
            CGFloat temp = frame.origin.y + frame.size.height;
            self.contentHeight = MAX(self.contentHeight, temp);
            yOffset[column] = [NSNumber numberWithFloat:yOffset[column].floatValue + height];
            
            column = column < (self.numberOfColumns - 1) ? (column + 1) : 0;
        }
    }
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSMutableArray<UICollectionViewLayoutAttributes *> *visibleLayoutAttributes = [[NSMutableArray alloc] init];
    
    for (UICollectionViewLayoutAttributes *attributes in self.cache) {
        if (CGRectIntersectsRect(attributes.frame, rect)) {
            [visibleLayoutAttributes addObject:attributes];
        }
    }
    
    return visibleLayoutAttributes;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    return self.cache[indexPath.row];
}

@end
