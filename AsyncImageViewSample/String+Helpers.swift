//
//  String+Helpers.swift
//  ClickSend CRM
//
//  Created by Panfilo Mariano on 4/24/17.
//  Copyright © 2017 ClickSend. All rights reserved.
//

import Foundation

extension String {
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    func toBase64() -> String {
        return Data(self.utf8).base64EncodedString()
    }
    
    func toMD5()  -> String {
        
        if let messageData = self.data(using:String.Encoding.utf8) {
            var digestData = Data(count: Int(CC_MD5_DIGEST_LENGTH))
            
            _ = digestData.withUnsafeMutableBytes {digestBytes in
                messageData.withUnsafeBytes {messageBytes in
                    CC_MD5(messageBytes, CC_LONG((messageData.count)), digestBytes)
                }
            }
            return digestData.hexString()
        }
        
        return self
    }
}
