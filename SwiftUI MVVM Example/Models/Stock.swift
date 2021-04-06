//
//  Stock.swift
//  SwiftUI MVVM Example
//
//  Created by Fomagran on 2021/04/06.
//

import Foundation

struct Stock:Codable {
    let symbol:String
    let description:String
    let price:Double
    let change:String
}
