//
//  ItemsListWorkerTests.swift
//  Hero-iOSTest
//
//  Created by inso on 18/12/2018.
//  Copyright (c) 2018 Thomas Moussajee. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import Hero_iOSTest
import XCTest
import Platform

class ItemsListWorkerTests: XCTestCase
{
  // MARK: Subject under test
  
  var sut: ItemsListWorker!
  
  // MARK: Test lifecycle
  
  override func setUp() {
    super.setUp()
    setupItemsListWorker()
  }
  
  override func tearDown() {
    super.tearDown()
  }
  
  // MARK: Test setup
  
  func setupItemsListWorker() {
	sut = ItemsListWorker(provider: APIClient.self)
  }
  
  // MARK: Test doubles
  
  // MARK: Tests
  
  func testSomething() {
    // Given
    
    // When
    
    // Then
  }
}