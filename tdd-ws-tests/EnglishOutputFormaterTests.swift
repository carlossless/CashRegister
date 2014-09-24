//
//  EnglishOutputFormaterTests.swift
//  tdd-ws
//
//  Created by Karolis Stasaitis on 24/09/14.
//  Copyright (c) 2014 delanoir. All rights reserved.
//

import Cocoa
import XCTest

class EnglishOutputFormaterTests: XCTestCase {

    func testCorrectPriceOutput() {
        let formater = EnglishOutputFormater()
        
        XCTAssertEqual("10.00 Lt",  formater.formatPrice(10))
    }
    
    func testCorrectNotFoundBarcodeMessage() {
        let formater = EnglishOutputFormater()
        
        XCTAssertEqual("Product not found for 12345",  formater.formatNonExistantBarcodeError("12345"))
    }
    
    func testCorrectEmptyBarcodeMessage() {
        let formater = EnglishOutputFormater()
        
        XCTAssertEqual("Scanning error: empty barcode",  formater.formatEmptyBarcodeError())
    }

}
