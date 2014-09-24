//
//  Product.swift
//  tdd-ws
//
//  Created by Karolis Stasaitis on 23/09/14.
//  Copyright (c) 2014 delanoir. All rights reserved.
//

import Cocoa

class Product : Equatable {
    
    let price : Double
    let barcode : String
    
    init(price : Double, barcode : String) {
        self.price = price
        self.barcode = barcode
    }
    
}

func ==(lhs: Product, rhs: Product) -> Bool {
    return (lhs.barcode == rhs.barcode) && (lhs.price == rhs.price)
}