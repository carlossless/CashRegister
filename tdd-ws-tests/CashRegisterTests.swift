//
//  CashRegisterTests.swift
//  tdd-ws
//
//  Created by Karolis Stasaitis on 23/09/14.
//  Copyright (c) 2014 delanoir. All rights reserved.
//

import Cocoa
import XCTest

class CashRegisterTests: XCTestCase {
    
    func testCorrentSystemOutputForCorrectBarcode() {
        let item = CashRegister(lcdScreen: LCDScreen(), cart: Cart(), catalog: Catalog(products: [Product(price: 24.50, barcode: "12345")]));
        
        item.barcodeDetected("12345")
        
        XCTAssertEqual(item.lcdScreen.displayedString, "24.50 Lt", "")
    }
    
    func testCorrentSystemOutputForIncorrectBarcode() {
        let item = CashRegister(lcdScreen: LCDScreen(), cart: Cart(), catalog: Catalog(products: [Product(price: 24.50, barcode: "12345")]));
        
        item.barcodeDetected("99999")
        
        XCTAssertEqual(item.lcdScreen.displayedString, "Product not found for 99999", "")
    }
    
    func testCorrentSystemOutputForNullBarcode() {
        let item = CashRegister(lcdScreen: LCDScreen(), cart: Cart(), catalog: Catalog(products: [Product(price: 24.50, barcode: "12345")]));
        
        item.barcodeDetected("")
        
        XCTAssertEqual(item.lcdScreen.displayedString, "Scanning error: empty barcode", "")
    }
    
}
