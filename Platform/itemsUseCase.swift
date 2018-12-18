//
//  itemsUseCase.swift
//  Domain
//
//  Created by inso on 17/12/2018.
//  Copyright © 2018 Thomas Moussajee. All rights reserved.
//

import Foundation
import Domain

extension APIClient: ItemsUseCase {
	static public func getItems(parameters: [String: Any],
								completion: @escaping ItemCompletion) {
		let itemsUrl = "/items"
		
		let urlString = self.baseUrl +
			itemsUrl +
			APIClient.queryItems(parameters)
		
		guard let url = URL(string: urlString) else {
			debugPrint("Error in URL composition")
			return
		}
		print(url.absoluteString)
		self.get(url: url) { (data, error) in
			
			if let data = data {
				self.decoder.decode(data: data,
									model: [Item].self,
									completion: completion,
									strategy: Item.decodeStrategy)
			} else if let error = error {
				completion(nil, error)
			} else {
				completion(nil, nil)
			}
			
		}
	}
}
