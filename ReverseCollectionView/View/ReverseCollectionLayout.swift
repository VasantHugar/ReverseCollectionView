//
//  ReverseCollectionLayout.swift
//  ReverseCollectionView
//
//  Created by Vasant Hugar on 09/02/19.
//  Copyright © 2019 Vasant Hugar. All rights reserved.
//

import UIKit

class ReverseCollectionLayout: UICollectionViewLayout {
    
    private var numberOfColumns = 2
    
    private var cellSpacing: CGFloat = 10
    
    private var cellHeight: CGFloat {
        
        if let collectionView = self.collectionView {

            let totalSpace = cellSpacing * CGFloat(numberOfColumns + 1)
            let availableWidthForCells = collectionView.frame.width - totalSpace
            
            return availableWidthForCells / CGFloat(numberOfColumns)
        }
        return CGFloat.leastNonzeroMagnitude
    }
    
    override func prepare() {
        super.prepare()
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        var layoutAttrs = [UICollectionViewLayoutAttributes]()
        
        if let collectionView = self.collectionView {
            
            for section in 0 ..< collectionView.numberOfSections {
                
                if let numberOfSectionItems = numberOfItemsInSection(section) {
                    
                    for item in 0 ..< numberOfSectionItems {
                        
                        let indexPath = IndexPath(item: item, section: section)
                        let layoutAttr = layoutAttributesForItem(at: indexPath)
                        
                        if let layoutAttr = layoutAttr, layoutAttr.frame.intersects(rect) {
                            layoutAttrs.append(layoutAttr)
                        }
                    }
                }
            }
        }
        
        return layoutAttrs
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        
        let layoutAttr = UICollectionViewLayoutAttributes(forCellWith: indexPath)
        let contentSize = self.collectionViewContentSize
        
        let actualRow = (indexPath.item / numberOfColumns)
        let actualRowUnit = CGFloat(actualRow + 1)
        
        let isFirstColumnFromRight = indexPath.row % numberOfColumns == 0
        
        layoutAttr.frame = CGRect(
            x: isFirstColumnFromRight ? cellHeight + (2 * cellSpacing) : cellSpacing,
            y: contentSize.height - (cellHeight + cellSpacing) * actualRowUnit,
            width: cellHeight,
            height: cellHeight)
        
        return layoutAttr
    }
    
    func numberOfItemsInSection(_ section: Int) -> Int? {
        
        if let collectionView = self.collectionView, let numSectionItems = collectionView.dataSource?.collectionView(collectionView, numberOfItemsInSection: section) {
            return numSectionItems
        }
        return 0
    }
    
    override var collectionViewContentSize: CGSize {
        
        get {
            var height: CGFloat = 0.0
            var bounds = CGRect.zero
            
            if let collectionView = self.collectionView {
                for section in 0 ..< collectionView.numberOfSections {
                    if let numItems = numberOfItemsInSection(section) {
                        height += CGFloat(numItems / numberOfColumns) * cellHeight
                    }
                }
                bounds = collectionView.bounds
            }
            return CGSize(width: bounds.width, height: max(height, bounds.height))
        }
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        
        if let oldBounds = self.collectionView?.bounds, oldBounds.width != newBounds.width || oldBounds.height != newBounds.height {
            return true
        }
        return false
    }
}
