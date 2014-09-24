//
//  STDOUTScreen.swift
//  tdd-ws
//
//  Created by Karolis Stasaitis on 24/09/14.
//  Copyright (c) 2014 delanoir. All rights reserved.
//

import Cocoa
import XCTest

class STDOUTScreenTests: XCTestCase {
    class MockFormater : OutputFormaterProtocol {
        
        var countFormatPriceCalled = 0;
        var countFormatNonExistantBarcodeErrorCalled = 0;
        var countFormatEmptyBarcodeErrorCalled = 0;
        
        func formatPrice(price : Double) -> String {
            countFormatPriceCalled++
            return "formatPrice \(price)"
        }
        func formatNonExistantBarcodeError(barcode: String) -> String {
            countFormatNonExistantBarcodeErrorCalled++
            return "barcode \(barcode)"
        }
        func formatEmptyBarcodeError() -> String {
            countFormatEmptyBarcodeErrorCalled++
            return "empty"
        }
    }
    
    func testShowsPrice() {
        let formater = MockFormater()
        let lcdScreen = STDOUTScreen(outputFormater: formater)
        
        lcdScreen.displayPrice(10)
        
        XCTAssertEqual(formater.countFormatPriceCalled, 1)
        XCTAssertEqual(lcdScreen.displayedString, "formatPrice 10.0")
    }
    
    func testShowsNonExistantBarcode() {
        let formater = MockFormater()
        let lcdScreen = STDOUTScreen(outputFormater: formater)
        
        lcdScreen.displayNonExistantBarcodeError("12345")
        
        XCTAssertEqual(formater.countFormatNonExistantBarcodeErrorCalled, 1)
        XCTAssertEqual(lcdScreen.displayedString, "barcode 12345")
    }
    
    func testShowsEmptyBarcode() {
        let formater = MockFormater()
        let lcdScreen = STDOUTScreen(outputFormater: formater)
        
        lcdScreen.displayEmptyBarcodeError()
        
        XCTAssertEqual(formater.countFormatEmptyBarcodeErrorCalled, 1)
        XCTAssertEqual(lcdScreen.displayedString, "empty")
    }

}
