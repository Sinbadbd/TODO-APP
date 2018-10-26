//
//  optionset.swift
//  IOSDEV
//
//  Created by sinbad on 10/26/18.
//  Copyright © 2018 sinbad. All rights reserved.
//

import Foundation


struct ButtonOption: OptionSet {
    let rawValue: Int
    
    static let roundedText = ButtonOption(rawValue: 1 << 0)
    static let squareIcon  = ButtonOption(rawValue: 1 << 1)
}
