//
//  CartTests.swift
//  tdd-ws
//
//  Created by Karolis Stasaitis on 24/09/14.
//  Copyright (c) 2014 delanoir. All rights reserved.
//

import Cocoa
import XCTest

class CartTests: XCTestCase {

    func testComputesCorrectSum() {
        
        let cart = Cart()
        
        cart.addProduct(Product(price: 10, barcode: "12345"))
        cart.addProduct(Product(price: 20, barcode: "12145"))
        
        XCTAssertEqual(30, cart.computeSum())
    }

}
