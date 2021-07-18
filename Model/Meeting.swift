//
//  Meeting.swift
//  UI-261
//
//  Created by nyannyan0328 on 2021/07/17.
//

import SwiftUI

struct Meeting: Identifiable {
    var id = UUID().uuidString
    var title : String
    var timing : Date
    var color : Color = Color("Blue")
    var turendon : Bool = false
    var menberrist = "Public"
    var numbers : [String] = Array(repeating: "", count: 10)
}

