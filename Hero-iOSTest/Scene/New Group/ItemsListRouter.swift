//
//  ItemsListRouter.swift
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

@objc protocol ItemsListRoutingLogic {
}

protocol ItemsListDataPassing {
	var dataStore: ItemsListDataStore? { get }
}

class ItemsListRouter: NSObject, ItemsListRoutingLogic, ItemsListDataPassing {
	weak var viewController: ItemsListViewController?
	var dataStore: ItemsListDataStore?
	
}
