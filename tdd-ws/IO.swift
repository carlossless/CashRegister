//
//  Helper.swift
//  tdd-ws
//
//  Created by Karolis Stasaitis on 24/09/14.
//  Copyright (c) 2014 delanoir. All rights reserved.
//

import Cocoa

class IO {
    class func readln(max:Int = 8192) -> String {
        assert(max > 0, "max must be between 1 and Int.max")
        
        var buf:Array<CChar> = []
        var c = getchar()
        while c != EOF && c != 10 && buf.count < max {
            buf.append(CChar(c))
            c = getchar()
        }
        
        return NSString(bytes: buf, length: Int(buf.count), encoding: NSASCIIStringEncoding) as String
    }
}
