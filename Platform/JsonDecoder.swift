//
//  JsonDecoder.swift
//  Domain
//
//  Created by inso on 17/12/2018.
//  Copyright © 2018 Thomas Moussajee. All rights reserved.
//

import Foundation


public protocol MyDecoderProtocols {
	
	typealias DecoderCompletion<T: Decodable> = (T?, Error?) -> Void
	
	typealias StrategyProvider = (([CodingKey]) -> CodingKey)
	
	static func decode<T: Decodable>(data: Data,
									 model: T.Type,
									 completion: DecoderCompletion<T>?,
									 strategy: StrategyProvider?)
	
}

public class MyJsonDecoder: MyDecoderProtocols{

	public typealias type = Decodable
	
	public static func decode<T>(data: Data, model: T.Type, completion: ((T?, Error?) -> Void)?, strategy: MyJsonDecoder.StrategyProvider?) where T : Decodable {
		let decoder = JSONDecoder()
		if let strategy = strategy {
			decoder.keyDecodingStrategy = .custom(strategy)
		}
		
		do {
			let item : T = try decoder.decode(T.self,from: data)
			if let completion = completion {
				completion(item as T, nil)
			}
		} catch {
			debugPrint(error)
			if let completion = completion {
				completion(nil, error)
			}
		}
	}
	
}
