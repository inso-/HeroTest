//
//  ItemCollectionViewCell
//  Hero-iOSTest
//
//  Created by inso on 17/12/2018.
//  Copyright © 2018 Thomas Moussajee. All rights reserved.
//

import Foundation
import Domain

struct ItemCellModels {
	let item: Item?
}

class ItemCollectionViewCell: UICollectionViewCell {
	
	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var itemNameLabel: UILabel!
	@IBOutlet weak var itemAuthorLabel: UILabel!
	
	public func setup(_ models: ItemCellModels?) {
		self.itemNameLabel.text = models?.item?.name ?? "No Name"
		self.itemAuthorLabel.text = models?.item?.author ?? "unknow"
	}
}

