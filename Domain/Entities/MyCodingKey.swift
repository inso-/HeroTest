//
//  MyCodingKey.swift
//  Platform
//
//  Created by inso on 17/12/2018.
//  Copyright © 2018 Thomas Moussajee. All rights reserved.
//

import Foundation

struct MyCodingKey: CodingKey {
	
	var stringValue: String
	
	init?(stringValue: String) {
		self.stringValue = stringValue
	}
	
	var intValue: Int? {
		return nil
	}
	
	init?(intValue: Int) {
		return nil
	}
}
