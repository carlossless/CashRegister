//
//  OutputFormater.swift
//  tdd-ws
//
//  Created by Karolis Stasaitis on 24/09/14.
//  Copyright (c) 2014 delanoir. All rights reserved.
//

import Foundation

protocol OutputFormaterProtocol {
    func formatPrice(price : Double) -> String
    func formatNonExistantBarcodeError(barcode: String) -> String
    func formatEmptyBarcodeError() -> String
}

class EnglishOutputFormater : OutputFormaterProtocol {
    
    func formatPrice(price : Double) -> String {
        return NSString(format: "%.2f Lt", price)
    }
    
    func formatNonExistantBarcodeError(barcode: String) -> String {
        return "Product not found for \(barcode)";
    }
    
    func formatEmptyBarcodeError() -> String {
        return "Scanning error: empty barcode"
    }
    
}