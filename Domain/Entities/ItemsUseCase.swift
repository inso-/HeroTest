//
//  ItemsUseCase.swift
//  Platform
//
//  Created by inso on 17/12/2018.
//  Copyright © 2018 Thomas Moussajee. All rights reserved.
//

import Foundation

public typealias ItemCompletion = ([Item]?, Error?) -> Void

public protocol ItemsUseCase {
	static func getItems(parameters: [String: Any],
				  completion: @escaping ItemCompletion) -> Void
}
