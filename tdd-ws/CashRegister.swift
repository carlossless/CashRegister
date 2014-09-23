//
//  CashRegister.swift
//  tdd-ws
//
//  Created by Karolis Stasaitis on 23/09/14.
//  Copyright (c) 2014 delanoir. All rights reserved.
//

import Cocoa

class CashRegister {
    
    let lcdScreen : LCDScreen
    let cart : Cart
    let catalog : Catalog
    
    init(lcdScreen : LCDScreen, cart : Cart, catalog : Catalog) {
        self.lcdScreen = lcdScreen
        self.cart = cart
        self.catalog = catalog
    }
    
    func barcodeDetected(barcode : String) {
        if (barcode.isEmpty) {
            lcdScreen.displayEmptyBarcodeError()
            return;
        }
        
        let product = catalog.productForBarcode(barcode)
        if (product != nil) {
            lcdScreen.displayPrice(product!.price)
            cart.addProduct(product!)
        }
        else {
            lcdScreen.displayNonExistantBarcodeError(barcode)
        }
    }
    
    func finishTransaction() -> Double {
        return cart.computeSum()
    }

}
