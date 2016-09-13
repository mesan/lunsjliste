//
//  Logger.swift
//  LunsjListe
//
//  Created by Fredrick Biering on 13/09/16.
//  Copyright © 2016 Fredrick Biering. All rights reserved.
//

import Foundation

class Logger {
    class func printDebug(_ items: Any...) {
        #if DEBUG
            print(items)
        #endif
    }
}
