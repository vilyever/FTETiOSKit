//
//  VDCoverCollectionViewLayout.h
//  TestAutoHeightTableView
//
//  Created by FTET on 15/1/4.
//  Copyright (c) 2015年 Vilyever. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, VDCoverCollectionViewLayoutUnderfillCoverType) {
    VDCoverCollectionViewLayoutUnderfillCoverTypeNone = 0,
    VDCoverCollectionViewLayoutUnderfillCoverTypeHypodispersion,
    VDCoverCollectionViewLayoutUnderfillCoverTypeScale,
    VDCoverCollectionViewLayoutUnderfillCoverTypeCenter,
};

/// A supplementary view that identifies the header for a given section.
extern NSString *const VDCoverCollectionElementKindSectionHeader;
/// A supplementary view that identifies the footer for a given section.
extern NSString *const VDCoverCollectionElementKindSectionFooter;

@class VDCoverCollectionViewLayout;

/**
 *  The VDCoverCollectionViewLayoutDelegate protocol defines methods that let you coordinate with a
 *  VDCoverCollectionViewLayout object to implement a waterfall-based layout.
 *  The methods of this protocol define the size of items.
 *
 *  The waterfall layout object expects the collection view’s delegate object to adopt this protocol.
 *  Therefore, implement this protocol on object assigned to your collection view’s delegate property.
 */
@protocol VDCoverCollectionViewLayoutDelegate <UICollectionViewDelegate>
@required
/**
 *  Asks the delegate for the size of the specified item’s cell.
 *
 *  @param collectionView
 *    The collection view object displaying the waterfall layout.
 *  @param collectionViewLayout
 *    The layout object requesting the information.
 *  @param indexPath
 *    The index path of the item.
 *
 *  @return
 *    The original size of the specified item. Both width and height must be greater than 0.
 */
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;

@optional
/**
 *  Asks the delegate for the column count in a section
 *
 *  @param collectionView
 *    The collection view object displaying the waterfall layout.
 *  @param collectionViewLayout
 *    The layout object requesting the information.
 *  @param section
 *    The section.
 *
 *  @return
 *    The original column count for that section. Must be greater than 0.
 */
- (NSInteger)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout columnCountForSection:(NSInteger)section;

/**
 *  Asks the delegate for the height of the header view in the specified section.
 *
 *  @param collectionView
 *    The collection view object displaying the waterfall layout.
 *  @param collectionViewLayout
 *    The layout object requesting the information.
 *  @param section
 *    The index of the section whose header size is being requested.
 *
 *  @return
 *    The height of the header. If you return 0, no header is added.
 *
 *  @discussion
 *    If you do not implement this method, the waterfall layout uses the value in its headerHeight property to set the size of the header.
 *
 *  @see
 *    headerHeight
 */
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout heightForHeaderInSection:(NSInteger)section;

/**
 *  Asks the delegate for the height of the footer view in the specified section.
 *
 *  @param collectionView
 *    The collection view object displaying the waterfall layout.
 *  @param collectionViewLayout
 *    The layout object requesting the information.
 *  @param section
 *    The index of the section whose header size is being requested.
 *
 *  @return
 *    The height of the footer. If you return 0, no footer is added.
 *
 *  @discussion
 *    If you do not implement this method, the waterfall layout uses the value in its footerHeight property to set the size of the footer.
 *
 *  @see
 *    footerHeight
 */
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout heightForFooterInSection:(NSInteger)section;

/**
 * Asks the delegate for the insets in the specified section.
 *
 * @param collectionView
 *   The collection view object displaying the waterfall layout.
 * @param collectionViewLayout
 *   The layout object requesting the information.
 * @param section
 *   The index of the section whose insets are being requested.
 *
 * @discussion
 *   If you do not implement this method, the waterfall layout uses the value in its sectionInset property.
 *
 * @return
 *   The insets for the section.
 */
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section;

/**
 * Asks the delegate for the header insets in the specified section.
 *
 * @param collectionView
 *   The collection view object displaying the waterfall layout.
 * @param collectionViewLayout
 *   The layout object requesting the information.
 * @param section
 *   The index of the section whose header insets are being requested.
 *
 * @discussion
 *   If you do not implement this method, the waterfall layout uses the value in its headerInset property.
 *
 * @return
 *   The headerInsets for the section.
 */
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForHeaderInSection:(NSInteger)section;

/**
 * Asks the delegate for the footer insets in the specified section.
 *
 * @param collectionView
 *   The collection view object displaying the waterfall layout.
 * @param collectionViewLayout
 *   The layout object requesting the information.
 * @param section
 *   The index of the section whose footer insets are being requested.
 *
 * @discussion
 *   If you do not implement this method, the waterfall layout uses the value in its footerInset property.
 *
 * @return
 *   The footerInsets for the section.
 */
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForFooterInSection:(NSInteger)section;

/**
 * Asks the delegate for the minimum spacing between two items in the same column
 * in the specified section. If this method is not implemented, the
 * minimumInteritemSpacing property is used for all sections.
 *
 * @param collectionView
 *   The collection view object displaying the waterfall layout.
 * @param collectionViewLayout
 *   The layout object requesting the information.
 * @param section
 *   The index of the section whose minimum interitem spacing is being requested.
 *
 * @discussion
 *   If you do not implement this method, the waterfall layout uses the value in its minimumInteritemSpacing property to determine the amount of space between items in the same column.
 *
 * @return
 *   The minimum interitem spacing.
 */
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section;

@end

@interface VDCoverCollectionViewLayout : UICollectionViewLayout

@property (nonatomic, assign) UICollectionViewScrollDirection scrollDirection;

/**
 *  @brief How many columns for this layout.
 *  @discussion Default: 1
 */
@property (nonatomic, assign) NSInteger columnCount;

@property (nonatomic, assign) VDCoverCollectionViewLayoutUnderfillCoverType underfillCoverType;

@property (nonatomic, assign) BOOL enablePagedCell;

/**
 *  @brief The minimum spacing to use between successive columns.
 *  @discussion Default: 10.0
 */
@property (nonatomic, assign) CGFloat minimumColumnSpacing;

/**
 *  @brief The minimum spacing to use between items in the same column.
 *  @discussion Default: 10.0
 *  @note This spacing is not applied to the space between header and columns or between columns and footer.
 */
@property (nonatomic, assign) CGFloat minimumInteritemSpacing;

/**
 *  @brief Height for section header
 *  @discussion
 *    If your collectionView's delegate doesn't implement `collectionView:layout:heightForHeaderInSection:`,
 *    then this value will be used.
 *
 *    Default: 0
 */
@property (nonatomic, assign) CGFloat headerHeight;

/**
 *  @brief Height for section footer
 *  @discussion
 *    If your collectionView's delegate doesn't implement `collectionView:layout:heightForFooterInSection:`,
 *    then this value will be used.
 *
 *    Default: 0
 */
@property (nonatomic, assign) CGFloat footerHeight;

/**
 *  @brief The margins that are used to lay out the header for each section.
 *  @discussion
 *    These insets are applied to the headers in each section.
 *    They represent the distance between the top of the collection view and the top of the content items
 *    They also indicate the spacing on either side of the header. They do not affect the size of the headers or footers themselves.
 *
 *    Default: UIEdgeInsetsZero
 */
@property (nonatomic, assign) UIEdgeInsets headerInset;

/**
 *  @brief The margins that are used to lay out the footer for each section.
 *  @discussion
 *    These insets are applied to the footers in each section.
 *    They represent the distance between the top of the collection view and the top of the content items
 *    They also indicate the spacing on either side of the footer. They do not affect the size of the headers or footers themselves.
 *
 *    Default: UIEdgeInsetsZero
 */
@property (nonatomic, assign) UIEdgeInsets footerInset;

/**
 *  @brief The margins that are used to lay out content in each section.
 *  @discussion
 *    Section insets are margins applied only to the items in the section.
 *    They represent the distance between the header view and the columns and between the columns and the footer view.
 *    They also indicate the spacing on either side of columns. They do not affect the size of the headers or footers themselves.
 *
 *    Default: UIEdgeInsetsZero
 */
@property (nonatomic, assign) UIEdgeInsets sectionInset;

/**
 *  @brief The calculated width of an item in the specified section.
 *  @discussion
 *    The width of an item is calculated based on number of columns, the collection view width, and the horizontal insets for that section.
 */
- (CGFloat)itemLengthInSectionAtIndex:(NSInteger)section;

@end
