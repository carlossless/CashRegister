//
//  LCDScreenProtocol.swift
//  tdd-ws
//
//  Created by Karolis Stasaitis on 23/09/14.
//  Copyright (c) 2014 delanoir. All rights reserved.
//

import Foundation

protocol OutputDeviceProtocol {
    var displayedString : String { get }
    func displayPrice(price : Double)
    func displayNonExistantBarcodeError(barcode: String)
    func displayEmptyBarcodeError()
}

class LCDScreen : OutputDeviceProtocol {
    
    let outputFormater : OutputFormaterProtocol;
    
    private(set) var displayedString : String
    
    init(outputFormater : OutputFormaterProtocol) {
        self.outputFormater = outputFormater;
        displayedString = ""
    }
    
    func displayPrice(price : Double) {
        displayedString = outputFormater.formatPrice(price)
    }
    
    func displayNonExistantBarcodeError(barcode: String) {
        displayedString = outputFormater.formatNonExistantBarcodeError(barcode)
    }
    
    func displayEmptyBarcodeError() {
        displayedString = outputFormater.formatEmptyBarcodeError()
    }
    
}

class STDOUTScreen : OutputDeviceProtocol
{
    let outputFormater : OutputFormaterProtocol;
    
    private(set) var displayedString : String
    
    init(outputFormater : OutputFormaterProtocol) {
        self.outputFormater = outputFormater;
        displayedString = ""
    }
    
    func displayPrice(price : Double) {
        displayedString = outputFormater.formatPrice(price)
        println(displayedString)
    }
    
    func displayNonExistantBarcodeError(barcode: String) {
        displayedString = outputFormater.formatNonExistantBarcodeError(barcode)
        println(displayedString)
    }
    
    func displayEmptyBarcodeError() {
        displayedString = outputFormater.formatEmptyBarcodeError()
        println(displayedString)
    }
}