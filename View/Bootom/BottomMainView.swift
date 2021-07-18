//
//  BottomMainView.swift
//  UI-261
//
//  Created by nyannyan0328 on 2021/07/18.
//

import SwiftUI

struct BottomMainView: View {
    var body: some View {
        MainButton()
    }
}

struct BottomMainView_Previews: PreviewProvider {
    static var previews: some View {
        BottomMainView()
    }
}


struct MainButton : View{
    
    @State var picker = Date()
    
    @State var showSheet = false
    
    var body: some View{
        
        
        NavigationView{
            
            
            VStack(spacing:30){
                
                
                TextShimer(title: "Enter Add")
                    .font(.system(size: 60, weight: .heavy))
                
                Button {
                    
                    withAnimation{
                        
                        showSheet.toggle()
                    }
                    
                } label: {
                    
      
                        
                        
                       
                        
                        
                        let time = picker.formatted(date: .long, time: .omitted)
                        
                        let date = picker.formatted(date: .complete, time: .shortened)
                        
                        Text("***\(time)\(date)***")
                            .font(.title3.bold())
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.primary)
                           
              
                    
                }
            }
            .preferredColorScheme(.dark)
            .navigationBarTitle("Half Model Sheet")
            .halfSheet(showSheet: $showSheet) {
                
                ZStack{
                    
                    Color.red.opacity(0.3)
                        .ignoresSafeArea()
                    
                    VStack(spacing:20){
                        
                        DatePicker("", selection: $picker, displayedComponents: [.date, .hourAndMinute])
                            .labelsHidden()
                            
                        
                        
                        Button("ShowSheet"){
                            
                            showSheet.toggle()
                        }
                    }
                    .frame(maxHeight: .infinity)
                }
                
                
                
            } onEnd: {
                
                
              
                  
                
                
                
            }

        }
        
    }
        
}

struct TextShimer : View{
    
    var title : String
    
    @State var show = false
    
    var body: some View{
        
        
        ZStack{
            
            Text(title)
                .font(.system(size: 60, weight: .heavy))
                .foregroundColor(.white)
            
            HStack(spacing:0){
                
                
                ForEach(0..<title.count,id:\.self){index in
                    
                    
                    Text(String(title[title.index(title.startIndex,offsetBy:index)]))
                        .font(.system(size: 60, weight: .heavy))
                        .foregroundColor(RandomColor())
                    
                }
            }
            .mask(
                
                Rectangle()
                    .fill(
                        LinearGradient(colors: [.red,.green,.orange] + Array(repeating: Color.red, count: 30), startPoint: .leading, endPoint: .trailing)
                    
                    
                    )
                    .rotationEffect(.init(degrees: -70))
                    .offset(x: -250)
                    .offset(x: show ? 500 : 0)
            
              
            )
           
            .onAppear {
                
                withAnimation(Animation.linear.repeatForever(autoreverses: false).speed(0.3)){
                    
                    
                    show.toggle()
                }
            }
            
            
            
        }
      
        
    }
    func RandomColor()->Color{
        
        let color = UIColor(displayP3Red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
        
        return Color(color)
        
        
    }
}

extension View{
    
    func halfSheet<SheetView : View>(showSheet : Binding<Bool>,@ViewBuilder sheetView : @escaping()->SheetView,onEnd :@escaping()->()) -> some View{
        
        
        return self
            .background(
                HalfSheetHelper(onEnd: onEnd, sheetView: sheetView(), showSheet: showSheet)
            
            )
            .onChange(of: showSheet.wrappedValue) { newValue in
                
                
                if !newValue{
                    
                    
                    onEnd()
                }
            }
    }
}


struct HalfSheetHelper<SheetView : View> : UIViewControllerRepresentable{
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    
    
    var onEnd : ()->()
    
    let controller = UIViewController()
    
     var sheetView : SheetView
    
    @Binding var showSheet : Bool
    
    
    
    
    
    func makeUIViewController(context: Context) -> UIViewController {
        
        controller.view.backgroundColor = .clear
        
        return controller
        
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
        if showSheet{
            
            
            if uiViewController.presentedViewController == nil{
                
                
                let sheetController = CustomHostingController(rootView: sheetView)
                
                sheetController.presentationController?.delegate = context.coordinator
                
                uiViewController.present(sheetController, animated: true)
            }
            
            
           
            
            
        }
        
        else {
            
            if uiViewController.presentedViewController != nil{
                
                uiViewController.dismiss(animated: true)
                
                
            }
        }
        
    }
    
    class Coordinator : NSObject,UISheetPresentationControllerDelegate{
        
        var parent : HalfSheetHelper
        
        init(parent : HalfSheetHelper){
            
            self.parent = parent
        }
        
        func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
            
            
            parent.showSheet.toggle()
            
        }
        
        
    }
}

class CustomHostingController<Content:View> : UIHostingController<Content>{
    
   
    override func viewDidLoad() {
        
        if let presentationController = presentationController as? UISheetPresentationController{
            
            
            presentationController.detents = [.medium(),.large()]
            presentationController.prefersGrabberVisible = true
            
            
        }
    }
    
}
