//
//  ItemsListInteractor.swift
//  Hero-iOSTest
//
//  Created by inso on 17/12/2018.
//  Copyright (c) 2018 Thomas Moussajee. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import Platform
import Domain

protocol ItemsListBusinessLogic {
	func doGetItems(request: ItemsList.GetItems.Request)
	func filterItems(filter: @escaping (Item, Item) -> Bool)
}

protocol ItemsListDataStore {
	var viewModel: ItemsList.GetItems.ViewModel? { get set }
	var currentPage: Int { get set }
	var filter: ((Item, Item) -> Bool) { get set }
}

class ItemsListInteractor: ItemsListBusinessLogic, ItemsListDataStore {
	var filter: ((Item, Item) -> Bool) = {
		guard let name0 = $0.name else { return false } ;
		guard let name1 = $1.name else { return true} ;
		return name0 < name1
	}
	
	
	public var viewModel: ItemsList.GetItems.ViewModel?
	public var currentPage: Int = 0
	
	var presenter: ItemsListPresentationLogic?
	var worker: ItemsListWorker?
	
	func filterItems(filter: @escaping (Item, Item) -> Bool) {
		guard let viewModel = self.viewModel else {
			return
		}
		self.filter = filter
		self.presenter?.filterItems(filter: filter,
									viewModel: viewModel,
									completion: { viewModel in
										self.viewModel = viewModel
		})
	}
	
	func doGetItems(request: ItemsList.GetItems.Request) {
		worker = ItemsListWorker(provider: APIClient.self)
		worker?.getItems(parameters: request.dictionaryRepresentation,
						 completion: {result, error in
							let response = ItemsList.GetItems.Response(result: result,
																	   error: error)
							self.presenter?.presentItems(response: response, completion: { viewModel in
								if let viewModel = self.viewModel, let newItems = viewModel.items {
									self.viewModel?.items?.append(contentsOf: newItems)
									if let items = self.viewModel?.items {
										self.viewModel?.items = Array(Set<Item>(items))
										self.filterItems(filter: self.filter)
									}
								} else {
									self.viewModel = viewModel
									self.filterItems(filter: self.filter)
								}
							})
							
		})
	}
}

