//
//  MeetingViewModel.swift
//  UI-261
//
//  Created by nyannyan0328 on 2021/07/17.
//

import SwiftUI

class MeetingViewModel: ObservableObject {
    @Published var meetings : [Meeting] = [
    
//    Meeting(title: "A", timing: Date()),
//    Meeting(title: "B", timing: Date()),
    ]
    
    @Published var addNewMeeting = false
}

