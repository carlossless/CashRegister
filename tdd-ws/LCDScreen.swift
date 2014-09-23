//
//  LCDScreenProtocol.swift
//  tdd-ws
//
//  Created by Karolis Stasaitis on 23/09/14.
//  Copyright (c) 2014 delanoir. All rights reserved.
//

import Foundation

class LCDScreen {
    
    private(set) var displayedString : String
    
    init() {
        displayedString = ""
    }
    
    func displayPrice(price : Double) {
        displayedString = NSString(format: "%.2f Lt", price)
    }
    
    func displayNonExistantBarcodeError(barcode: String) {
        displayedString = "Product not found for \(barcode)";
    }
    
    func displayEmptyBarcodeError() {
        displayedString = "Scanning error: empty barcode"
    }
    
}