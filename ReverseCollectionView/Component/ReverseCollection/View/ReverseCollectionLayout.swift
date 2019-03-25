//
//  ReverseCollectionLayout.swift
//  ReverseCollectionView
//
//  Created by Vasant Hugar on 09/02/19.
//  Copyright © 2019 Vasant Hugar. All rights reserved.
//

import UIKit

class ReverseCollectionLayout: UICollectionViewLayout {
    
    var numberOfColumns = 2
    
    var cellSpacing: CGFloat = 5
    
    private var cellWidth: CGFloat {
        
        if let collectionView = self.collectionView {
            
            let totalSpace = cellSpacing * CGFloat(numberOfColumns + 1)
            let availableWidthForCells = collectionView.frame.width - totalSpace
            
            return availableWidthForCells / CGFloat(numberOfColumns)
        }
        return CGFloat.leastNonzeroMagnitude
    }
    
    private var cellHeight: CGFloat {
        return cellWidth + 10
    }
    
    override func prepare() {
        super.prepare()
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        var layoutAttrs = [UICollectionViewLayoutAttributes]()
        
        if let collectionView = self.collectionView {
            
            for section in 0 ..< collectionView.numberOfSections {
                
                if let numberOfItemsInSection = numberOfItemsInSection(section) {
                    
                    for item in 0 ..< numberOfItemsInSection {
                        
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
        
        let rowIndex = (indexPath.item / numberOfColumns)
        print("Row Index: \(rowIndex)")
        
        let columnIndex = numberOfColumns - (indexPath.row % numberOfColumns + 1)
        print("Column Index: \(columnIndex)")
        
        layoutAttr.frame = CGRect(x: cellSpacing + ((cellWidth + cellSpacing) * CGFloat(columnIndex)),
                                  y: contentSize.height - (cellHeight + cellSpacing) * CGFloat(rowIndex + 1),
                                  width: cellWidth,
                                  height: cellHeight)
        
        return layoutAttr
    }
    
    override var collectionViewContentSize: CGSize {
        
        get {
            var height: CGFloat = 0.0
            var bounds = CGRect.zero
            
            if let collectionView = self.collectionView {
                for section in 0 ..< collectionView.numberOfSections {
                    if let numberOfItemsInSection = numberOfItemsInSection(section) {
                        let actualRow = CGFloat(numberOfItemsInSection / numberOfColumns) + CGFloat(numberOfItemsInSection % numberOfColumns == 0 ? 0 : 1)
                        height += actualRow * cellHeight + (actualRow + 1) * cellSpacing
                    }
                }
                bounds = collectionView.bounds
            }
            return CGSize(width: bounds.width, height: max(height, bounds.height))
        }
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        if let oldBounds = self.collectionView?.bounds, (oldBounds.width != newBounds.width || oldBounds.height != newBounds.height) {
            return true
        }
        return false
    }
}

extension ReverseCollectionLayout {
    
    private func numberOfItemsInSection(_ section: Int) -> Int? {
        
        if let collectionView = self.collectionView, let numSectionItems = collectionView.dataSource?.collectionView(collectionView, numberOfItemsInSection: section) {
            return numSectionItems
        }
        return 0
    }
}
