//
//  Home.swift
//  UI-261
//
//  Created by nyannyan0328 on 2021/07/16.
//

import SwiftUI

struct Home: View {
    @State var selected = "L Stick"
    
    init(){
        
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        TabView(selection:$selected){
            
            GeometryReader{proxy in
                
                let topEge = proxy.safeAreaInsets.top
                
                FirstView(topEdge: topEge)
                    .padding(.top,topEge)
                    .ignoresSafeArea(.all, edges: .top)
                
                
            }
                .tag("First")
            
           MeetingMain()
                .tag("Weather")
            
            StaggeMainView()
                .tag("L Stick")
            
             BottomMainView()
                .tag("DownLoad")
            
            
        }
        .overlay(CustomTabBar(selected: $selected),alignment: .bottom)
        
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
