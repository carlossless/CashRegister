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
    
    class CartMock : CartProtocol {
        let returnSum : Double;
        
        var countAddProductCalled = 0;
        var countClearProductsCalled = 0;
        var countComputeSumCalled = 0;
        
        init (sum : Double) {
            returnSum = sum
        }
        
        func addProduct(product : Product) {
            countAddProductCalled++
        }
        
        func clearProducts() {
            countClearProductsCalled++
        }
        
        func computeSum() -> Double {
            countComputeSumCalled++
            return returnSum;
        }
    }
    
    class OutputDeviceMock : OutputDeviceProtocol {
        var displayedString : String = ""
        
        var countDisplayPriceCalled = 0;
        var countDisplayNonExistantBarcodeError = 0;
        var countDisplayEmptyBarcodeError = 0;
        
        func displayPrice(price : Double) {
            countDisplayPriceCalled++
            displayedString = "\(price)"
        }
        func displayNonExistantBarcodeError(barcode: String) {
            countDisplayNonExistantBarcodeError++
            displayedString = barcode
            
        }
        func displayEmptyBarcodeError() {
            countDisplayEmptyBarcodeError++
            displayedString = "Scanning error: empty barcode"
        }
    }
    
    class CatalogMock : CatalogProtocol {
        var countProductForBarcodeCalled = 0;
        
        func productForBarcode(barcode : String?) -> Product? {
            countProductForBarcodeCalled++
            if barcode == "12345" {
                return Product(price: 24.50, barcode: "12345")
            }
            else {
                return nil
            }
        }
    }
    
    func testCorrentSystemOutputForCorrectBarcode() {
        let outputDevice = OutputDeviceMock()
        let cart = CartMock(sum: 24.50)
        let catalog = CatalogMock()
        let item = CashRegister(lcdScreen: outputDevice, cart: cart, catalog: catalog);
        
        item.barcodeDetected("12345")
        
        XCTAssertEqual(catalog.countProductForBarcodeCalled, 1)
        XCTAssertEqual(cart.countAddProductCalled, 1)
        XCTAssertEqual(outputDevice.countDisplayPriceCalled, 1)
        XCTAssertEqual(item.lcdScreen.displayedString, "24.5", "")
    }
    
    func testCorrentSystemOutputForIncorrectBarcode() {
        let outputDevice = OutputDeviceMock()
        let cart = CartMock(sum: 24.50)
        let catalog = CatalogMock()
        let item = CashRegister(lcdScreen: outputDevice, cart: cart, catalog: catalog);
        
        item.barcodeDetected("99999")
        
        XCTAssertEqual(catalog.countProductForBarcodeCalled, 1)
        XCTAssertEqual(cart.countAddProductCalled, 0)
        XCTAssertEqual(outputDevice.countDisplayNonExistantBarcodeError, 1)
        XCTAssertEqual(item.lcdScreen.displayedString, "99999", "")
    }
    
    func testCorrentSystemOutputForNullBarcode() {
        let outputDevice = OutputDeviceMock()
        let cart = CartMock(sum: 24.50)
        let catalog = CatalogMock()
        let item = CashRegister(lcdScreen: outputDevice, cart: cart, catalog: catalog);
        
        item.barcodeDetected("")
        
        XCTAssertEqual(catalog.countProductForBarcodeCalled, 0)
        XCTAssertEqual(cart.countAddProductCalled, 0)
        XCTAssertEqual(outputDevice.countDisplayEmptyBarcodeError, 1)
        XCTAssertEqual(item.lcdScreen.displayedString, "Scanning error: empty barcode", "")
    }
    
    func testCorrentSystemOutputForCheckout() {
        let outputDevice = OutputDeviceMock()
        let cart = CartMock(sum: 100)
        let catalog = CatalogMock()
        let item = CashRegister(lcdScreen: outputDevice, cart: cart, catalog: catalog);
        
        item.barcodeDetected("12345")
        item.barcodeDetected("12345")
        item.barcodeDetected("12345")
        
        XCTAssertEqual(cart.countAddProductCalled, 3)
        
        item.finishTransaction()
        
        XCTAssertEqual(catalog.countProductForBarcodeCalled, 3)
        XCTAssertEqual(cart.countClearProductsCalled, 1)
        XCTAssertEqual(outputDevice.countDisplayPriceCalled, 4)
        XCTAssertEqual(item.lcdScreen.displayedString, "100.0", "")
    }
    
}
