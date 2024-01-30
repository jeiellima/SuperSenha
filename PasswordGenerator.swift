//
//  PasswordGenerator.swift
//  SuperSenha
//
//  Created by Jeiel Lima on 26/01/24.
//

import Foundation

class PasswordGenerator {
    var numberOfChar: Int
    var useLower: Bool
    var useUpper: Bool
    var useNumber: Bool
    var useSpecialChar: Bool
    
    var passwords: [String] = []
    
    private let letters = "abcdefghijklmnopqrtuvwxyz"
    private let specialChar = "!@#$%ˆ&*()_-+={:<>?}{|,./]['"
    private let numbers = "0123456789"
    
    init(numberOfChar: Int, useLower: Bool, useUpper: Bool, useNumber: Bool, useSpecialChar: Bool) {
        
        var numchars = min(numberOfChar, 16)
        numchars = max(numchars, 1)
        
        self.numberOfChar = numchars
        self.useLower = useLower
        self.useUpper = useUpper
        self.useNumber = useNumber
        self.useSpecialChar = useSpecialChar
    }
    
    func generate(total: Int) -> [String] {
        passwords.removeAll()
        var universe = ""
        
        if useLower {
            universe += letters
        }
        
        if useUpper {
            universe += letters.uppercased()
        }
        
        if useNumber {
            universe += numbers
        }
        
        if useSpecialChar {
            universe += specialChar
        }
        
        let universeArray = Array(universe)
        while passwords.count < total {
            var password = ""
            for _ in 1...numberOfChar {
                let index = Int(arc4random_uniform(UInt32(universeArray.count)))
                password += String(universeArray[index])
            }
            passwords.append(password)
        }
        return passwords
    }
}
