//
//  MeetingCardView.swift
//  UI-261
//
//  Created by nyannyan0328 on 2021/07/17.
//

import SwiftUI

struct MeetingCardView: View {
    @Binding var meetings : Meeting
    var body: some View {
      
        
        VStack{
            
            HStack(alignment:.top,spacing:10){
                
                
                VStack(spacing:10){
                    
                    Text(meetings.timing.formatted(date: .numeric, time: .omitted))
                        .font(.title2)
                    
                    Text(meetings.title)
                        .font(.title2.weight(.semibold))
                    
                    Text("\(meetings.numbers.count) Member join")
                        .font(.caption)
                }
                
                
             Spacer()
                
                
                ZStack(alignment:meetings.turendon ? .trailing : .leading){
                    
                    
                    Capsule()
                        .fill(.secondary)
                        .frame(width: 35, height: 20)
                    
                    
                Circle()
                        .fill(Color.white)
                        .frame(width: 20, height: 20)
                    
                    
                    
                }
                .onTapGesture {
                    meetings.turendon.toggle()
                }
                
                
                
                
                
            }
            .foregroundColor(getColor())
           
            
            
            HStack(spacing:-10){
                
                ForEach(1...3,id:\.self){index in
                    
                    Image("animoji\(index)")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 25, height: 25)
                        .padding(4)
                        .background(.white,in: Circle())
                        .background(
                        
                        Circle()
                            .stroke(.red,lineWidth: 3)
                        )
                    
                    
                }
                
                
                Spacer(minLength: 15)
                
                
                Button {
                    
                    
                } label: {
                    
                    Text("Join")
                        .font(.title2.bold())
                        .foregroundColor(.black)
                }
                .buttonStyle(.bordered)
                .tint(.white)
                .controlProminence(.increased)
                .shadow(radius: 10)

                
                
                
            }
            
            
            
        }
        .padding()
        .background(meetings.color,in: RoundedRectangle(cornerRadius: 10))
    }
    
    func getColor()->Color{
        
        if meetings.color == Color("Purple") || meetings.color == Color("Green"){return .white}
        
        else{
            
              return  .black
        }
        
    
            
        
    }
}

struct MeetingCardView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
