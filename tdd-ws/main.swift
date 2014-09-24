//
//  main.swift
//  tdd-ws
//
//  Created by Karolis Stasaitis on 23/09/14.
//  Copyright (c) 2014 delanoir. All rights reserved.
//

import Foundation

let cashRegister = CashRegister(lcdScreen: STDOUTScreen(outputFormater: EnglishOutputFormater()), cart: Cart(), catalog: InMemoryCatalog(products: [Product(price: 24.50, barcode: "12345")]))

println("Well something started, please enter a barcode, dude.")
while (true) {
    let try = IO.readln()
    if (try == "") {
        break;
    }
    else if (try == "done") {
        cashRegister.finishTransaction()
    }
    else {
        cashRegister.barcodeDetected(try)
    }
}
println("Cya!")