//
//  InMemoryCatalogTests.swift
//  tdd-ws
//
//  Created by Karolis Stasaitis on 24/09/14.
//  Copyright (c) 2014 delanoir. All rights reserved.
//

import Cocoa
import XCTest

class InMemoryCatalogTests: XCTestCase {

    func testFoundCorrectProduct() {
        let product = Product(price: 24.00, barcode: "12345")
        let catalog = InMemoryCatalog(products: [product])
        
        XCTAssertEqual(product, catalog.productForBarcode("12345")!)
    }
    
    func testNotFoundCorrectProduct() {
        let product = Product(price: 24.00, barcode: "12345")
        let catalog = InMemoryCatalog(products: [product])
        
        XCTAssertNil(catalog.productForBarcode("12346"))
    }

}
