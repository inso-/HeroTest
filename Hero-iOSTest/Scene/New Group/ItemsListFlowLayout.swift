//
//  ItemsListFlowLayout.swift
//  Hero-iOSTest
//
//  Created by inso on 17/12/2018.
//  Copyright © 2018 Thomas Moussajee. All rights reserved.
//

import Foundation


import UIKit

class ItemsListFlowLayout: UICollectionViewFlowLayout {
	
	let itemHeight: CGFloat = 50
	
	override init() {
		super.init()
		setupLayout()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		setupLayout()
	}
	
	func setupLayout() {
		minimumInteritemSpacing = 0
		minimumLineSpacing = 1
		scrollDirection = .vertical
	}
	
	func itemWidth() -> CGFloat {
		return collectionView!.frame.width
	}
	
	override var itemSize: CGSize {
		set {
			self.itemSize = CGSize(width: itemWidth(), height: itemHeight)
		}
		get {
			return CGSize(width: itemWidth(), height: itemHeight)
		}
	}
	
	override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
		return collectionView!.contentOffset
	}
}

