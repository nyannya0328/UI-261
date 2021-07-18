//
//  CustomTabBar.swift
//  UI-261
//
//  Created by nyannyan0328 on 2021/07/16.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var selected : String
  
    var body: some View {
        HStack(spacing:0){
            
            TabButton(title: "First", image: "house", currenTab: $selected)
            
            TabButton(title: "Weather", image: "sun.min.fill", currenTab: $selected)
            
            TabButton(title: "L Stick", image: "l.joystick", currenTab:$selected)
            
            TabButton(title: "DownLoad", image: "square.and.arrow.up.fill", currenTab: $selected)
            
        }
        .frame(height: 70)
        .background(
        
            LinearGradient(colors: getGra(), startPoint: .leading, endPoint: .trailing)
        )
    }
    
    func getGra() -> [Color]{
        
        let array = Array(repeating: Color.blue.opacity(0.3), count: 10)
        
        let colos : [Color] = [
            
            
            .red.opacity(0.3),
            .blue.opacity(0.3),
            .blue.opacity(0.3),
            .blue.opacity(0.3),
        
        
        ]
        
        let combolinear = colos + array + colos.reversed()
        
        return combolinear
        
        
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TabButton : View{
    
    var title : String
    var image : String
    @Binding var currenTab : String
    
    var body: some View{
        
        Button {
            withAnimation{
                
                currenTab = title
            }
        } label: {
            VStack{
                
                Image(systemName: image)
                    .font(.title2)
                
                
                Text(title)
                    .font(.caption.bold())
                
                
                
                
                
            }
            .foregroundColor(currenTab == title ? .primary : .gray)
            .frame(maxWidth: .infinity)
        }

        
        
        
    }
}
