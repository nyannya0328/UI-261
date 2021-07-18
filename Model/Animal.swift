//
//  Animal.swift
//  UI-261
//
//  Created by nyannyan0328 on 2021/07/16.
//

import SwiftUI

struct Animal: Identifiable {
    var id = UUID().uuidString
   
    var artWork : String
    var title : String
}
var animals = [

    Animal(artWork: "p1", title: "The best in Dog!"),
    Animal(artWork: "p2", title: "The face of king"),
    Animal(artWork: "p3", title: "I Should propable get to sleep now"),
    Animal(artWork: "p4", title: "I'm going to bed  now"),
    Animal(artWork: "p5", title: "You fly is open"),
    Animal(artWork: "p6", title: "I don't won't see"),
    

]
