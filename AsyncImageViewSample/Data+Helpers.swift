//
//  Data+Helpers.swift
//  ClickSend
//
//  Created by Panfilo Mariano on 1/10/17.
//  Copyright © 2017 Panfilo Mariano. All rights reserved.
//

import Foundation

extension Data {
    
    func hexString() -> String {
        let string = self.map{ String($0, radix:16) }.joined()
        return string
    }
    
}
