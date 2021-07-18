//
//  Post.swift
//  UI-261
//
//  Created by nyannyan0328 on 2021/07/18.
//

import SwiftUI

struct Post: Identifiable,Hashable {
    var id = UUID().uuidString
    var imageURL : String
}

