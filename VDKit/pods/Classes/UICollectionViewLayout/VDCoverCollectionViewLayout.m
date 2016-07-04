//
//  VDCoverCollectionViewLayout.m
//  TestAutoHeightTableView
//
//  Created by FTET on 15/1/4.
//  Copyright (c) 2015年 Vilyever. All rights reserved.
//

#import "VDCoverCollectionViewLayout.h"

NSString *const VDCoverCollectionElementKindSectionHeader = @"VDCoverCollectionElementKindSectionHeader";
NSString *const VDCoverCollectionElementKindSectionFooter = @"VDCoverCollectionElementKindSectionFooter";

@interface VDCoverCollectionViewLayout()

/// The delegate will point to collection view's delegate automatically.
@property (nonatomic, weak) id <VDCoverCollectionViewLayoutDelegate> delegate;
/// Array to store height for each column
@property (nonatomic, strong) NSMutableArray *columnHeights;
/// Array of arrays. Each array stores item attributes for each section
@property (nonatomic, strong) NSMutableArray *sectionItemAttributes;
/// Array to store attributes for all items includes headers, cells, and footers
@property (nonatomic, strong) NSMutableArray *allItemAttributes;
/// Dictionary to store section headers' attribute
@property (nonatomic, strong) NSMutableDictionary *headersAttribute;
/// Dictionary to store section footers' attribute
@property (nonatomic, strong) NSMutableDictionary *footersAttribute;
/// Array to store union rectangles
@property (nonatomic, strong) NSMutableArray *unionRects;

@property (nonatomic, assign) BOOL isUnderfill;
@property (nonatomic, strong) NSMutableArray *sectionUnderfillGaps;
@property (nonatomic, strong) NSMutableArray *sectionMinimumColumnSpacings;

@end

@implementation VDCoverCollectionViewLayout

/// How many items to be union into a single rectangle
const NSInteger unionSize = 20;

#pragma Public Accessors
- (void)setScrollDirection:(UICollectionViewScrollDirection)scrollDirection
{
    if (_scrollDirection != scrollDirection)
    {
        _scrollDirection = scrollDirection;
        [self invalidateLayout];
    }
}

- (void)setColumnCount:(NSInteger)columnCount
{
    if (_columnCount != columnCount)
    {
        _columnCount = columnCount;
        [self invalidateLayout];
    }
}

- (void)setUnderfillCoverType:(VDCoverCollectionViewLayoutUnderfillCoverType)underfillCoverType
{
    if (_underfillCoverType != underfillCoverType)
    {
        _underfillCoverType = underfillCoverType;
        
        [self invalidateLayout];
    }
}

- (void)setEnablePagedCell:(BOOL)enablePagedCell
{
    if (_enablePagedCell != enablePagedCell)
    {
        _enablePagedCell = enablePagedCell;
        if (_enablePagedCell)
        {
            self.columnCount = 1;
            self.minimumColumnSpacing = 0.0f;
            self.minimumInteritemSpacing = 0.0f;
            self.headerHeight = 0.0f;
            self.footerHeight = 0.0f;
            self.headerInset = UIEdgeInsetsZero;
            self.footerInset = UIEdgeInsetsZero;
            self.sectionInset = UIEdgeInsetsZero;
        }
        [self invalidateLayout];
    }
}

- (void)setMinimumColumnSpacing:(CGFloat)minimumColumnSpacing
{
    if (_minimumColumnSpacing != minimumColumnSpacing)
    {
        _minimumColumnSpacing = minimumColumnSpacing;
        [self invalidateLayout];
    }
}

- (void)setMinimumInteritemSpacing:(CGFloat)minimumInteritemSpacing
{
    if (_minimumInteritemSpacing != minimumInteritemSpacing)
    {
        _minimumInteritemSpacing = minimumInteritemSpacing;
        [self invalidateLayout];
    }
}

- (void)setHeaderHeight:(CGFloat)headerHeight
{
    if (_headerHeight != headerHeight)
    {
        _headerHeight = headerHeight;
        [self invalidateLayout];
    }
}

- (void)setFooterHeight:(CGFloat)footerHeight
{
    if (_footerHeight != footerHeight)
    {
        _footerHeight = footerHeight;
        [self invalidateLayout];
    }
}

- (void)setHeaderInset:(UIEdgeInsets)headerInset
{
    if (!UIEdgeInsetsEqualToEdgeInsets(_headerInset, headerInset) )
    {
        _headerInset = headerInset;
        [self invalidateLayout];
    }
}

- (void)setFooterInset:(UIEdgeInsets)footerInset
{
    if (!UIEdgeInsetsEqualToEdgeInsets(_footerInset, footerInset) )
    {
        _footerInset = footerInset;
        [self invalidateLayout];
    }
}

- (void)setSectionInset:(UIEdgeInsets)sectionInset
{
    if (!UIEdgeInsetsEqualToEdgeInsets(_sectionInset, sectionInset) )
    {
        _sectionInset = sectionInset;
        [self invalidateLayout];
    }
}

- (NSInteger)columnCountForSection:(NSInteger)section
{
    if ( [self.delegate respondsToSelector:@selector(collectionView:layout:columnCountForSection:) ] )
    {
        return [self.delegate collectionView:self.collectionView layout:self columnCountForSection:section];
    }
    else
    {
        return self.columnCount;
    }
}

- (CGFloat)itemLengthInSectionAtIndex:(NSInteger)section
{
    UIEdgeInsets sectionInset;
    if ( [self.delegate respondsToSelector:@selector(collectionView:layout:insetForSectionAtIndex:) ] )
    {
        sectionInset = [self.delegate collectionView:self.collectionView layout:self insetForSectionAtIndex:section];
    }
    else
    {
        sectionInset = self.sectionInset;
    }
    
    CGFloat length = 0.0f;
    
    if (self.scrollDirection == UICollectionViewScrollDirectionVertical)
    {
        length = self.collectionView.frame.size.width - sectionInset.left - sectionInset.right;
        
    }
    else
    {
        length = self.collectionView.frame.size.height - sectionInset.top - sectionInset.bottom;
    }
    
    NSInteger columnCount = [self columnCountForSection:section];
//    return floorf( (length - (columnCount - 1) * self.minimumColumnSpacing) / columnCount);
    return (length - (columnCount - 1) * self.minimumColumnSpacing) / columnCount;
}

#pragma mark - Private Accessors
- (NSMutableDictionary *)headersAttribute
{
    if (!_headersAttribute)
    {
        _headersAttribute = [NSMutableDictionary dictionary];
    }
    return _headersAttribute;
}

- (NSMutableDictionary *)footersAttribute
{
    if (!_footersAttribute)
    {
        _footersAttribute = [NSMutableDictionary dictionary];
    }
    return _footersAttribute;
}

- (NSMutableArray *)unionRects
{
    if (!_unionRects)
    {
        _unionRects = [NSMutableArray array];
    }
    return _unionRects;
}

- (NSMutableArray *)columnHeights
{
    if (!_columnHeights)
    {
        _columnHeights = [NSMutableArray array];
    }
    return _columnHeights;
}

- (NSMutableArray *)allItemAttributes
{
    if (!_allItemAttributes)
    {
        _allItemAttributes = [NSMutableArray array];
    }
    return _allItemAttributes;
}

- (NSMutableArray *)sectionItemAttributes
{
    if (!_sectionItemAttributes)
    {
        _sectionItemAttributes = [NSMutableArray array];
    }
    return _sectionItemAttributes;
}

- (NSMutableArray *)sectionUnderfillGaps
{
    if (!_sectionUnderfillGaps)
    {
        _sectionUnderfillGaps = [NSMutableArray array];
    }
    return _sectionUnderfillGaps;
}

- (NSMutableArray *)sectionMinimumColumnSpacings
{
    if (!_sectionMinimumColumnSpacings)
    {
        _sectionMinimumColumnSpacings = [NSMutableArray array];
    }
    return _sectionMinimumColumnSpacings;
}

- (id <VDCoverCollectionViewLayoutDelegate> )delegate
{
    return (id <VDCoverCollectionViewLayoutDelegate> )self.collectionView.delegate;
}

#pragma mark - Initial
- (id)init
{
    if (self = [super init] )
    {
        [self initial];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder] )
    {
        [self initial];
    }
    return self;
}

- (void)initial
{
    _columnCount = 2;
    _minimumColumnSpacing = 10;
    _minimumInteritemSpacing = 10;
    _headerHeight = 0;
    _footerHeight = 0;
    _sectionInset = UIEdgeInsetsZero;
    _headerInset  = UIEdgeInsetsZero;
    _footerInset  = UIEdgeInsetsZero;
}

#pragma override
- (void)prepareLayout
{
    [super prepareLayout];
    
    NSInteger numberOfSections = [self.collectionView numberOfSections];
    if (numberOfSections == 0)
    {
        return;
    }
    
    NSAssert([self.delegate conformsToProtocol:@protocol(VDCoverCollectionViewLayoutDelegate)], @"UICollectionView's delegate should conform to VDCoverCollectionViewLayoutDelegate protocol");
    NSAssert(self.columnCount > 0 || [self.delegate respondsToSelector:@selector(collectionView:layout:columnCountForSection:)], @"UICollectionViewWaterfallLayout's columnCount should be greater than 0, or delegate must implement columnCountForSection:");
    
    // Initialize variables
    NSInteger idx = 0;
    
    [self.headersAttribute removeAllObjects];
    [self.footersAttribute removeAllObjects];
    [self.unionRects removeAllObjects];
    [self.columnHeights removeAllObjects];
    [self.allItemAttributes removeAllObjects];
    [self.sectionItemAttributes removeAllObjects];
    
    for (NSInteger section = 0; section < numberOfSections; section++)
    {
        NSInteger columnCount = [self columnCountForSection:section];
        NSMutableArray *sectionColumnHeights = [NSMutableArray arrayWithCapacity:columnCount];
        for (idx = 0; idx < columnCount; idx++)
        {
            [sectionColumnHeights addObject:@(0) ];
        }
        [self.columnHeights addObject:sectionColumnHeights];
        
        if (!self.isUnderfill)
        {
            [self.sectionUnderfillGaps addObject:@(0) ];
            [self.sectionMinimumColumnSpacings addObject:@(-1) ];
        }
    }
    
    // Create attributes
    CGFloat location = 0.0f;
    
    UICollectionViewLayoutAttributes *attributes;
    
    for (NSInteger section = 0; section < numberOfSections; ++section)
    {
        if (self.underfillCoverType == VDCoverCollectionViewLayoutUnderfillCoverTypeCenter
            && self.isUnderfill)
        {
            location += [self.sectionUnderfillGaps[section] floatValue] / 2.0f;
        }
        
        /*
         * 1. Get section-specific metrics (minimumInteritemSpacing, sectionInset)
         */
        CGFloat minimumInteritemSpacing;
        if (self.underfillCoverType == VDCoverCollectionViewLayoutUnderfillCoverTypeHypodispersion
            && self.isUnderfill
            && [self.sectionMinimumColumnSpacings[section] floatValue] >= 0.0f)
        {
            minimumInteritemSpacing = [self.sectionMinimumColumnSpacings[section] floatValue];
        }
        else if ( [self.delegate respondsToSelector:@selector(collectionView:layout:minimumInteritemSpacingForSectionAtIndex:) ] )
        {
            minimumInteritemSpacing = [self.delegate collectionView:self.collectionView layout:self minimumInteritemSpacingForSectionAtIndex:section];
        }
        else
        {
            minimumInteritemSpacing = self.minimumInteritemSpacing;
        }
        
        UIEdgeInsets sectionInset;
        if ( [self.delegate respondsToSelector:@selector(collectionView:layout:insetForSectionAtIndex:) ] )
        {
            sectionInset = [self.delegate collectionView:self.collectionView layout:self insetForSectionAtIndex:section];
        }
        else
        {
            sectionInset = self.sectionInset;
        }
        
        CGFloat width = self.collectionView.frame.size.width - sectionInset.left - sectionInset.right;
        CGFloat height = self.collectionView.frame.size.height - sectionInset.top - sectionInset.bottom;
        NSInteger columnCount = [self columnCountForSection:section];
//        CGFloat itemWidth = floorf( (width - (columnCount - 1) * self.minimumColumnSpacing) / columnCount);
//        CGFloat itemHeight = floorf( (height - (columnCount - 1) * self.minimumColumnSpacing) / columnCount);
        CGFloat itemWidth = (width - (columnCount - 1) * self.minimumColumnSpacing) / columnCount;
        CGFloat itemHeight = (height - (columnCount - 1) * self.minimumColumnSpacing) / columnCount;
        
        /*
         * 2. Section header
         */
        CGFloat headerLength;
        if ( [self.delegate respondsToSelector:@selector(collectionView:layout:heightForHeaderInSection:) ] )
        {
            headerLength = [self.delegate collectionView:self.collectionView layout:self heightForHeaderInSection:section];
        }
        else
        {
            headerLength = self.headerHeight;
        }
        
        UIEdgeInsets headerInset;
        if ( [self.delegate respondsToSelector:@selector(collectionView:layout:insetForHeaderInSection:) ] )
        {
            headerInset = [self.delegate collectionView:self.collectionView layout:self insetForHeaderInSection:section];
        }
        else
        {
            headerInset = self.headerInset;
        }
        
        if (self.scrollDirection == UICollectionViewScrollDirectionVertical)
        {
            location += headerInset.top;
        }
        else
        {
            location += headerInset.left;
        }
        
        if (headerLength > 0)
        {
            attributes = [UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:VDCoverCollectionElementKindSectionHeader withIndexPath:[NSIndexPath indexPathForItem:0 inSection:section]];
            
            if (self.scrollDirection == UICollectionViewScrollDirectionVertical)
            {
                attributes.frame = CGRectMake(headerInset.left,
                                              location,
                                              self.collectionView.frame.size.width - (headerInset.left + headerInset.right),
                                              headerLength);
            }
            else
            {
                attributes.frame = CGRectMake(location,
                                              headerInset.top,
                                              headerLength,
                                              self.collectionView.frame.size.height - (headerInset.top + headerInset.bottom) );
            }
            
            self.headersAttribute[@(section) ] = attributes;
            [self.allItemAttributes addObject:attributes];
            
            if (self.scrollDirection == UICollectionViewScrollDirectionVertical)
            {
                location = CGRectGetMaxY(attributes.frame) + headerInset.bottom;
            }
            else
            {
                location = CGRectGetMaxX(attributes.frame) + headerInset.right;
            }
        }
        
        if (self.scrollDirection == UICollectionViewScrollDirectionVertical)
        {
            location += sectionInset.top;
        }
        else
        {
            location += sectionInset.left;
        }
        
        for (idx = 0; idx < columnCount; idx++)
        {
            self.columnHeights[section][idx] = @(location);
        }
        
        /*
         * 3. Section items
         */
        NSInteger itemCount = [self.collectionView numberOfItemsInSection:section];
        NSMutableArray *itemAttributes = [NSMutableArray arrayWithCapacity:itemCount];
        
        // Item will be put into shortest column.
        for (idx = 0; idx < itemCount; idx++)
        {
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:idx inSection:section];
//            NSUInteger columnIndex = [self nextColumnIndexForItem:idx inSection:section];
            NSUInteger columnIndex = [self shortestColumnIndexInSection:section];
            
            CGSize itemSize = [self.delegate collectionView:self.collectionView layout:self sizeForItemAtIndexPath:indexPath];
            CGFloat xOffset = 0.0f;
            CGFloat yOffset = 0.0f;
            
            if (self.enablePagedCell)
            {
                if (self.scrollDirection == UICollectionViewScrollDirectionVertical)
                {
                    xOffset = sectionInset.left + (itemWidth + self.minimumColumnSpacing) * columnIndex;
                    yOffset = [self.columnHeights[section][columnIndex] floatValue];
                }
                else
                {
                    xOffset = [self.columnHeights[section][columnIndex] floatValue];
                    yOffset = sectionInset.top + (itemHeight + self.minimumColumnSpacing) * columnIndex;
                }
            }
            else
            {
                if (self.scrollDirection == UICollectionViewScrollDirectionVertical)
                {
                    xOffset = sectionInset.left + (itemWidth + self.minimumColumnSpacing) * columnIndex;
                    yOffset = [self.columnHeights[section][columnIndex] floatValue];
                    if (itemSize.height > 0 && itemSize.width > 0)
                    {
//                        itemHeight = floorf(itemSize.height * itemWidth / itemSize.width);
                        itemHeight = itemSize.height * itemWidth / itemSize.width;
                        
                        if (self.underfillCoverType == VDCoverCollectionViewLayoutUnderfillCoverTypeScale
                            && self.isUnderfill)
                        {
                            NSInteger count = 0;
                            for (NSInteger section = 0; section < numberOfSections; ++section)
                            {
                                count += [self.collectionView numberOfItemsInSection:section];
                            }
                            itemHeight += [self.sectionUnderfillGaps[section] floatValue] / ceilf( (float)count / self.columnCount);
                        }
                    }
                }
                else
                {
                    xOffset = [self.columnHeights[section][columnIndex] floatValue];
                    yOffset = sectionInset.top + (itemHeight + self.minimumColumnSpacing) * columnIndex;
                    if (itemSize.height > 0 && itemSize.width > 0)
                    {
//                        itemWidth = floorf(itemSize.width * itemHeight / itemSize.height);
                        itemWidth = itemSize.width * itemHeight / itemSize.height;
                        
                        if (self.underfillCoverType == VDCoverCollectionViewLayoutUnderfillCoverTypeScale
                            && self.isUnderfill)
                        {
                            NSInteger count = 0;
                            for (NSInteger section = 0; section < numberOfSections; ++section)
                            {
                                count += [self.collectionView numberOfItemsInSection:section];
                            }
                            itemWidth += [self.sectionUnderfillGaps[section] floatValue] / ceilf( (float)count / self.columnCount);
                        }
                    }
                }
            }
            
            attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
            attributes.frame = CGRectMake(xOffset, yOffset, itemWidth, itemHeight);
            [itemAttributes addObject:attributes];
            [self.allItemAttributes addObject:attributes];
            
            if (self.scrollDirection == UICollectionViewScrollDirectionVertical)
            {
                self.columnHeights[section][columnIndex] = @(CGRectGetMaxY(attributes.frame) + minimumInteritemSpacing);
            }
            else
            {
                self.columnHeights[section][columnIndex] = @(CGRectGetMaxX(attributes.frame) + minimumInteritemSpacing);
            }
        }
        
        [self.sectionItemAttributes addObject:itemAttributes];
        
        /*
         * 4. Section footer
         */
        CGFloat footerLength;
        NSUInteger columnIndex = [self longestColumnIndexInSection:section];
        
        if (self.scrollDirection == UICollectionViewScrollDirectionVertical)
        {
            location = [self.columnHeights[section][columnIndex] floatValue] - minimumInteritemSpacing + sectionInset.bottom;
        }
        else
        {
            location = [self.columnHeights[section][columnIndex] floatValue] - minimumInteritemSpacing + sectionInset.right;
        }
        
        if ( [self.delegate respondsToSelector:@selector(collectionView:layout:heightForFooterInSection:) ] )
        {
            footerLength = [self.delegate collectionView:self.collectionView layout:self heightForFooterInSection:section];
        }
        else
        {
            footerLength = self.footerHeight;
        }
        
        UIEdgeInsets footerInset;
        if ( [self.delegate respondsToSelector:@selector(collectionView:layout:insetForFooterInSection:) ] )
        {
            footerInset = [self.delegate collectionView:self.collectionView layout:self insetForFooterInSection:section];
        }
        else
        {
            footerInset = self.footerInset;
        }
        
        if (self.scrollDirection == UICollectionViewScrollDirectionVertical)
        {
            location += footerInset.top;
        }
        else
        {
            location += footerInset.left;
        }
        
        if (footerLength > 0)
        {
            attributes = [UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:VDCoverCollectionElementKindSectionFooter withIndexPath:[NSIndexPath indexPathForItem:0 inSection:section] ];
            if (self.scrollDirection == UICollectionViewScrollDirectionVertical)
            {
                attributes.frame = CGRectMake(footerInset.left,
                                          location,
                                          self.collectionView.frame.size.width - (footerInset.left + footerInset.right),
                                          footerLength);
            }
            else
            {
                attributes.frame = CGRectMake(location,
                                              footerInset.top,
                                              footerLength,
                                              self.collectionView.frame.size.height - (footerInset.top + footerInset.bottom) );
            }
            
            self.footersAttribute[@(section)] = attributes;
            [self.allItemAttributes addObject:attributes];
            
            if (self.scrollDirection == UICollectionViewScrollDirectionVertical)
            {
                location = CGRectGetMaxY(attributes.frame) + footerInset.bottom;
            }
            else
            {
                location = CGRectGetMaxX(attributes.frame) + footerInset.right;
            }
        }
        
        for (idx = 0; idx < columnCount; idx++)
        {
            self.columnHeights[section][idx] = @(location);
        }
        
    } // end of for (NSInteger section = 0; section < numberOfSections; ++section)
    
    if (self.underfillCoverType != VDCoverCollectionViewLayoutUnderfillCoverTypeNone
        && !self.isUnderfill)
    {
        self.isUnderfill = YES;
        
        BOOL shouldRePrepareLayout = NO;
        
        CGFloat currentLoaction = 0.0f;
        
        for (NSInteger section = 0; section < numberOfSections; ++section)
        {
            CGFloat longestColumnLength = 0.0f;
            if (self.scrollDirection == UICollectionViewScrollDirectionVertical)
            {
                longestColumnLength = [ [self.columnHeights[section] firstObject] floatValue];
                [self.sectionUnderfillGaps replaceObjectAtIndex:section withObject:@(self.collectionView.bounds.size.height - (longestColumnLength - currentLoaction) ) ];
            }
            else
            {
                longestColumnLength = [ [self.columnHeights[section] firstObject] floatValue];
                [self.sectionUnderfillGaps replaceObjectAtIndex:section withObject:@(self.collectionView.bounds.size.width - (longestColumnLength - currentLoaction) ) ];
            }
            
            currentLoaction = longestColumnLength;
            
            if ( [self.sectionUnderfillGaps[section] floatValue] > 0.0f)
            {
                shouldRePrepareLayout = YES;
                switch (self.underfillCoverType) {
                    case VDCoverCollectionViewLayoutUnderfillCoverTypeHypodispersion:
                    {
                        NSInteger count = [self.collectionView numberOfItemsInSection:section];

                        [self.sectionMinimumColumnSpacings replaceObjectAtIndex:section withObject:@(_minimumInteritemSpacing + [self.sectionUnderfillGaps[section] floatValue] / (ceilf( (float)count / self.columnCount) - 1) ) ];
                        ;
                    }
                        break;
                    case VDCoverCollectionViewLayoutUnderfillCoverTypeScale:
                        break;
                    case VDCoverCollectionViewLayoutUnderfillCoverTypeCenter:
                        break;
                        
                    default:
                        break;
                }
                
            }
        }
        
        if (shouldRePrepareLayout)
        {
            [self prepareLayout];
            return;
        }
    }
    
    // Build union rects
    idx = 0;
    NSInteger itemCounts = [self.allItemAttributes count];
    while (idx < itemCounts)
    {
        CGRect unionRect = ( (UICollectionViewLayoutAttributes *)self.allItemAttributes[idx] ).frame;
        NSInteger rectEndIndex = MIN(idx + unionSize, itemCounts);
        
        for (NSInteger i = idx + 1; i < rectEndIndex; i++)
        {
            unionRect = CGRectUnion(unionRect, ( (UICollectionViewLayoutAttributes *)self.allItemAttributes[i] ).frame);
        }
        
        idx = rectEndIndex;
        
        [self.unionRects addObject:[NSValue valueWithCGRect:unionRect]];
    }
}

- (void)invalidateLayout
{
    if (self.isUnderfill)
    {
        [self.sectionUnderfillGaps removeAllObjects];
        [self.sectionMinimumColumnSpacings removeAllObjects];
        self.isUnderfill = NO;
    }
    [super invalidateLayout];
}

- (CGSize)collectionViewContentSize
{
    NSInteger numberOfSections = [self.collectionView numberOfSections];
    if (numberOfSections == 0)
    {
        return CGSizeZero;
    }
    
    CGSize contentSize = self.collectionView.bounds.size;
    
    if (self.scrollDirection == UICollectionViewScrollDirectionVertical)
    {
        contentSize.height = [ [ [self.columnHeights lastObject] firstObject] floatValue];
    }
    else
    {
        contentSize.width = [ [ [self.columnHeights lastObject] firstObject] floatValue];
    }
    
    return contentSize;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)path
{
    if (path.section >= [self.sectionItemAttributes count] )
    {
        return nil;
    }
    if (path.item >= [self.sectionItemAttributes[path.section] count] )
    {
        return nil;
    }
    return (self.sectionItemAttributes[path.section] )[path.item];
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForSupplementaryViewOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *attribute = nil;
    if ( [kind isEqualToString:VDCoverCollectionElementKindSectionHeader] )
    {
        attribute = self.headersAttribute[@(indexPath.section) ];
    }
    else if ([kind isEqualToString:VDCoverCollectionElementKindSectionFooter] )
    {
        attribute = self.footersAttribute[@(indexPath.section) ];
    }
    return attribute;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSInteger i;
    NSInteger begin = 0, end = self.unionRects.count;
    NSMutableArray *attrs = [NSMutableArray array];
    
    for (i = 0; i < self.unionRects.count; i++)
    {
        if (CGRectIntersectsRect(rect, [self.unionRects[i] CGRectValue]) )
        {
            begin = i * unionSize;
            break;
        }
    }
    for (i = self.unionRects.count - 1; i >= 0; i--)
    {
        if (CGRectIntersectsRect(rect, [self.unionRects[i] CGRectValue]) )
        {
            end = MIN((i + 1) * unionSize, self.allItemAttributes.count);
            break;
        }
    }
    for (i = begin; i < end; i++)
    {
        UICollectionViewLayoutAttributes *attr = self.allItemAttributes[i];
        if (CGRectIntersectsRect(rect, attr.frame) )
        {
            [attrs addObject:attr];
        }
    }
    
    return [NSArray arrayWithArray:attrs];
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    CGRect oldBounds = self.collectionView.bounds;
    
    if (self.scrollDirection == UICollectionViewScrollDirectionVertical
        && CGRectGetWidth(newBounds) != CGRectGetWidth(oldBounds) )
    {
        return YES;
    }
    
    if (self.scrollDirection == UICollectionViewScrollDirectionHorizontal
        && CGRectGetHeight(newBounds) != CGRectGetHeight(oldBounds) )
    {
        return YES;
    }
    
    return NO;
}

#pragma mark - Private Methods

/**
 *  Find the shortest column.
 *
 *  @return index for the shortest column
 */
- (NSUInteger)shortestColumnIndexInSection:(NSInteger)section
{
    __block NSUInteger index = 0;
    __block CGFloat shortestHeight = MAXFLOAT;
    
    [self.columnHeights[section] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        CGFloat height = [obj floatValue];
        if (height < shortestHeight)
        {
            shortestHeight = height;
            index = idx;
        }
    } ];
    
    return index;
}

/**
 *  Find the longest column.
 *
 *  @return index for the longest column
 */
- (NSUInteger)longestColumnIndexInSection:(NSInteger)section
{
    __block NSUInteger index = 0;
    __block CGFloat longestHeight = 0;
    
    [self.columnHeights[section] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        CGFloat height = [obj floatValue];
        if (height > longestHeight)
        {
            longestHeight = height;
            index = idx;
        }
    } ];
    
    return index;
}

/**
 *  Find the index for the next column.
 *
 *  @return index for the next column
 */
- (NSUInteger)nextColumnIndexForItem:(NSInteger)item inSection:(NSInteger)section
{
    NSUInteger index = 0;
    NSInteger columnCount = [self columnCountForSection:section];

    index = (item % columnCount);

    return index;
}

@end
