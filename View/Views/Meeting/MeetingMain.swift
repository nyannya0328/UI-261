//
//  MeetingMain.swift
//  UI-261
//
//  Created by nyannyan0328 on 2021/07/17.
//

import SwiftUI

struct MeetingMain: View {
    
    @State var slected = "Up Comming"
    @Namespace var animation
    
    @StateObject var model = MeetingViewModel()
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            
            VStack{
                
                
                Text("Hi guys")
                    .font(.largeTitle.bold())
                    .kerning(1.3)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .rotationEffect(.init(degrees: -1))
                
                HStack(alignment:.bottom){
                    
                    Text("Check your\n***Meeting Detatils***")
                        .font(.title2)
                        .foregroundColor(.primary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    
                    Spacer()
                    
                    
                    Button {
                        
                        withAnimation{
                            
                            model.addNewMeeting.toggle()
                        }
                        
                    } label: {
                        Text("ADD")
                            .font(.title3.bold())
                            .foregroundColor(.black)
                            .padding(.vertical)
                            .padding(.horizontal,10)
                            .background(
                            
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color.black,lineWidth: 2.5)
                            )
                            
                        
                    }

                        

                }
                .padding(.top,10)
                
                HStack(spacing:0){
                    
                    ForEach(["Up Comming","Onhold","Post","Details"],id:\.self){index in
                        
                        MeetingTabButton(title: index, selected: $slected, animation: animation)
                        
                        
                    }
                    
                }
                .padding(.top,25)
                
                
                if model.meetings.isEmpty{
                    
                    
                    Image("notes")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 160, height: 160)
                        .padding(.top,20)
                    
                    
                    Text("Add **Mettings**")
                }
                
                
                
                
            }
            .padding()
            
            VStack(spacing:15){
                
                
                ForEach($model.meetings){meeting in
                    
                    
                    MeetingCardView(meetings: meeting)
                    
                    
                }
            }
            .padding()
        }
        .background(Color("Bg"))
        .overlay(
        
            
            ZStack{
            
            if model.addNewMeeting{
                
                AddNewMeeting()
                    .environmentObject(model)
                
                
            
            }
        }
        
        )
    }
}

struct MeetingMain_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MeetingTabButton : View{
    
    var title : String
    @Binding var selected : String
    var animation : Namespace.ID
    var body: some View{
        
        Button {
            withAnimation {
                selected = title
            }
        } label: {
            VStack{
                
                
                Text(title)
                  
                
                ZStack{
                    
                    if selected == title{
                        
                        Capsule()
                            .fill(Color.purple)
                            .frame(width: 100, height: 1)
                            .matchedGeometryEffect(id: "TAB", in: animation)
                    }
                    
                    else{
                        Capsule()
                            .fill(Color.clear)
                            .frame(width: 100, height: 1)
                        
                        
                    }
                    
                    
                }
            }
          
            .foregroundColor  (selected == title ? .black : .gray)
            .frame(maxWidth: .infinity)
        }

        
        
    }
}


