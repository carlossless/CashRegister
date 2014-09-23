//
//  Cart.swift
//  tdd-ws
//
//  Created by Karolis Stasaitis on 23/09/14.
//  Copyright (c) 2014 delanoir. All rights reserved.
//

import Cocoa

class Cart {
    private var products : [Product]
    
    init() {
        products = [Product]();
    }
    
    func addProduct(product : Product) {
        products.append(product);
    }
    
    func clearProducts() {
        products = Array<Product>();
    }
    
    func computeSum() -> Double {
        return products.map({ p in p.price }).reduce(0, +)
    }
}