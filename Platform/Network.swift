//
//  Network.swift
//  Domain
//
//  Created by inso on 17/12/2018.
//  Copyright © 2018 Thomas Moussajee. All rights reserved.
//

import Foundation
import Domain

public class APIClient {
	
	static let baseUrl: String = "https://www.datakick.org/api"
	
	static let decoder: MyDecoderProtocols.Type = MyJsonDecoder.self
	
	public typealias DataCompletion = (Data?, Error?) -> Void
	
	
	static internal func get(url: URL, completion: @escaping DataCompletion) {
		URLSession.shared.dataTask(with: url) { (data, _, error) -> Void in
			if let error = error {
				return completion(nil, error)
			}
			guard let data = data else {
				// strange case no error, no data
				return completion(nil, nil)
			}
			return completion(data, nil)
		}.resume()
	}
	
	static internal func queryItems(_ dictionary: [String: Any]) -> String {
		var components = URLComponents()
		components.queryItems = dictionary.map {
			URLQueryItem(name: $0, value: String(describing: $1))
		}
		return (components.url?.absoluteString)!
	}
}
