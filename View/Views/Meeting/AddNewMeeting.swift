//
//  AddNewMeeting.swift
//  UI-261
//
//  Created by nyannyan0328 on 2021/07/17.
//

import SwiftUI


struct AddNewMeeting: View {
    @State var currentMeetingDate = Meeting(title: "", timing: Date())
    @EnvironmentObject var model : MeetingViewModel
    @State var selected = "Private"
    
    @State var showPicker = false
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            
            VStack{
                
                HStack{
                    
                    
                    Button(action: {
                        
                        withAnimation{
                            
                            
                            model.addNewMeeting.toggle()
                            
                        }
                        
                        
                    }, label: {
                        Image(systemName: "arrow.left")
                            .font(.system(size: 30, weight: .bold))
                            .foregroundColor(.black)
                            .padding(8)
                            .background(.quaternary,in: Circle())
                    })
                       
                    
                    
                    Spacer(minLength: 20)
                    
                    Image("pro")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())
                        
                        
                }
                
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    Text("Enter Meeting Number")
                        .font(.title3.bold())
                    
                    TextField("Enter", text: $currentMeetingDate.title)
                    
                        .font(.system(size: 15, weight: .thin))
                    
                    
                Divider()
                    
                    
                    
                }
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    Text("TIMING")
                        .font(.title3.bold())
                    
                    HStack{
                        
                        
                        let time = currentMeetingDate.timing.formatted(date: .numeric, time: .omitted)
                        
                        let data = currentMeetingDate.timing.formatted(date: .abbreviated, time: .shortened)
                        
                        
                        Text("\(time),\(data)")
                        
                        
                        Spacer(minLength: 30)
                        
                        
                        Button {
                            
                            withAnimation {
                                
                                showPicker.toggle()
                                
                                
                            }
                            
                        } label: {
                            Image(systemName: "calendar")
                                .font(.title2.bold())
                                .padding(9)
                                .background(.yellow,in: Circle())
                            
                        }

                        
                    }
                    
                  
                    
                    
                Divider()
                    
                    
                    
                }
                
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    Text("SelecteColloboration")
                        .font(.title3.bold())
                    
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
                        
                        
                        Spacer()
                        
                        
                        Button {
                            
                        } label: {
                            Text("Contact")
                                .font(.title2.bold())
                        }
                        .buttonStyle(.bordered)
                        .tint(.orange)
                        .controlProminence(.increased)
                        .shadow(radius: 15)

                    }
                    
                   
                    
                    
                Divider()
                    
                    
                    
                }
                
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    Text("Meeting Type")
                        .font(.title3.bold())
                    
                    HStack(spacing:10){
                        
                        
                        ForEach(["Private","Public","Oninvite"],id:\.self){index in
                            
                        MeetingsTabButton(title: index, selected: $selected)
                            
                            
                            
                        }
                        
                        
                    }
                    
                    
                Divider()
                    
                    
                    
                }
                
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    Text("Meeting Card Color")
                        .font(.title3.bold())
                    
                    let colors = [Color("Blue"),Color("Green"),Color("Purple"),Color("Red"),Color("Orange")]
                    
                   
                    HStack(spacing:10){
                        ForEach(colors,id:\.self){color in
                            
                            
                            Circle()
                                .fill(color)
                                .frame(width: 50, height: 50)
                                .overlay(
                                    
                                    
                                    Image(systemName: "xmark")
                                        .font(.title)
                                        .foregroundColor(.white)
                                        .opacity(currentMeetingDate.color == color ? 1 : 0)
                                
                                    
                                    
                                
                                )
                                .onTapGesture {
                                    
                                    currentMeetingDate.color = color
                                    
                                }
                            
                        }
                    }
                    
                    
                Divider()
                    
                    
                    
                }
                
           
                Spacer()
                
                
                
                Button {
                    
                    AddNewMeeeting()
                    
                } label: {
                    
                    Text("Sceduel")
                        .font(.title2.bold())
                        .foregroundColor(.white)
                        .padding(.vertical,10)
                        .padding(.horizontal,20)
                        .background(.black)
                        .clipShape(Capsule())
                }
                .disabled(currentMeetingDate.title == "")

                
                
                
            }
            
            
            
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color("Bg"))
        .overlay(CustomDataPicker(showPicker: $showPicker, date: $currentMeetingDate.timing))
        .transition(.move(edge: .bottom))
        
        
       
    }
    func AddNewMeeeting(){
        

            
            model.meetings.append(currentMeetingDate)
            
            model.addNewMeeting.toggle()
      
    }
}




struct MeetingsTabButton : View{
    
    var title : String
    @Binding var selected : String
    
    
    
    var body: some View{
        
        
        Button {
            withAnimation {
                selected = title
            }
        } label: {
            Text(title)
                .font(.caption)
                .foregroundColor(selected == title ? .white : .black)
                .frame(maxWidth: .infinity)
                .padding(.vertical,10)
                .padding(.horizontal,20)
                .background(
                
                    Capsule()
                        .fill(.black.opacity(selected == title ? 1 : 0))
                
                )
                .background(
                
                Capsule()
                    .stroke(.white,lineWidth: 1)
                
                )
                
            
        }
      

        
        
    }
}

struct AddNewMeeting_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CustomDataPicker : View{
    
    @Binding var showPicker : Bool
    @Binding var date : Date
    
    var body: some View{
        
        ZStack{
            
            Rectangle()
                .fill(.ultraThinMaterial)
                .ignoresSafeArea()
            
            
            DatePicker("", selection: $date,displayedComponents: ([.date,.hourAndMinute]))
                .labelsHidden()
                .datePickerStyle(.graphical)
            
            
            Button {
                
                withAnimation(.spring()) {
                    showPicker.toggle()
                }
                
            } label: {
                
                Image(systemName: "xmark")
                    .font(.system(size: 30, weight: .bold))
                    .padding()
                    .background(.gray,in: Circle())
                
            }
            .padding(10)
            .frame(maxWidth:.infinity, maxHeight: .infinity, alignment: .topTrailing)
          

            
            
            
            
            
        }
        .opacity(showPicker ? 1 : 0)
        
        
        
    }
    
    
}
