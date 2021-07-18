//
//  FirstView.swift
//  UI-261
//
//  Created by nyannyan0328 on 2021/07/16.
//

import SwiftUI

struct FirstView: View {
    var topEdge : CGFloat
    var body: some View {
        VStack(spacing:15){
            
            HStack {
                Text("***Todays For you***")
                    .font(.title)
                .foregroundColor(.blue)
                
                Spacer(minLength: 20)
                
                Image(systemName: "person")
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(.primary)
                    .overlay(
                        
                        Circle()
                            .fill(.red)
                            .frame(width: 18, height: 18)
                            .offset(x: -2, y: -2)
                    
                        ,alignment: .topTrailing
                    )
                
                
            }
            .padding(.horizontal)
            .frame(height: 70)
            
            
            GeometryReader{proxy in
                
                let size = proxy.size
                
                
                VerticalCarouselList {
                    
                    VStack(spacing:0){
                        
                        
                        ForEach(animals){animal in
                            AnimalCardView(animal: animal, topEdge: 70 + 15 + topEdge)
                                .frame(width: size.width, height: size.height)
                            
                            
                        }
                    }
                    
                    
                }
                
                
                
            }
            
            
            
            
            
            
            
            
            
        }
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AnimalCardView : View{
    
    var animal : Animal
    var topEdge : CGFloat

    var body: some View{
        
        
        GeometryReader{proxy in
            
            let size = proxy.size
            
            let minY = proxy.frame(in:.global).minY
            
            let progress = -minY / size.height
            
            let scale = 0.6 - (progress / 3)
            
            let opa = 1 - progress
            
    
            
            
            
            ZStack{
                
                Image(animal.artWork)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width - 30, height: size.height - 70)
                    .cornerRadius(15)
                
                
                
            }
            .padding(.horizontal)
            .scaleEffect(minY < 0 ? scale : 1.2)
            .offset(y:minY < 0 ? -minY : 0)
            .opacity(minY < 0 ? opa : 1)
            
            
           
        }
    }
}
