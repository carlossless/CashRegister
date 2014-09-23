//
//  Catalog.swift
//  tdd-ws
//
//  Created by Karolis Stasaitis on 23/09/14.
//  Copyright (c) 2014 delanoir. All rights reserved.
//

import Cocoa

class Catalog {
    
    private(set) var products : [Product]
    
    init(products : [Product]) {
        self.products = products;
    }
    
    func productForBarcode(barcode : String?) -> Product? {
        return self.products.filter({ p in p.barcode == barcode }).first;
    }
    
}
