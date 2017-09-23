//
//  Random.swift
//  Random
//
//  Created by Bernardo Breder on 17/01/17.
//
//

import Foundation

public class SecureRandom {
    
    public class func generate(_ max: UInt32 = UInt32.max) -> UInt32 {
        #if os(Linux)
            return UInt32(random()) % max
        #else
            return arc4random_uniform(max)
        #endif
    }
    
    public class func generatePassword() -> String {
        return randomText(32)
    }
    
    public class func randomText(_ length: Int) -> String {
        var chars = [UInt8]()
        while chars.count < length {
            let type = generate(3)
            if type == 0 {
                chars.append(UInt8(SecureRandom.generate(26)) + 97)
            } else if type == 1 {
                chars.append(UInt8(SecureRandom.generate(26)) + 65)
            } else {
                chars.append(UInt8(SecureRandom.generate(10)) + 48)
            }
        }
        return String(bytes: chars, encoding: .ascii)!
    }
    
}
