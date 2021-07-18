//
//  StaggeMainView.swift
//  UI-261
//
//  Created by nyannyan0328 on 2021/07/18.
//

import SwiftUI

struct StaggeMainView: View {
    @State var posts : [Post] = []
    
    @State var columns : Int = 2
    
    @Namespace var animation
    
    init(){
        
        UINavigationBar.appearance().barTintColor = .red
    }
    
     var body: some View {
         NavigationView{
             
             
             StaggeGridCard(columns: columns, list: posts) { post in
                 
                 PostCardView(post: post)
                     .matchedGeometryEffect(id: post.id
                                            , in: animation)
                 
                 
                 
             }
             .padding(.horizontal)
             .navigationTitle("Stagge Grid")
             .background(.red.opacity(0.3))
             .toolbar {
                 
                 ToolbarItem(placement: .navigationBarTrailing) {
                     
                     
                     Button {
                         
                         columns += 1
                     } label: {
                         
                         Image(systemName: "plus")
                         
                         
                         
                     }

                     
                 }
                 
                 ToolbarItem(placement: .navigationBarTrailing) {
                     
                     
                     Button {
                         
                         columns = max(columns - 1, 1)
                     } label: {
                         
                         Image(systemName: "minus")
                         
                         
                         
                     }

                     
                 }
             }
             .animation(.easeInOut, value: columns)
             
             
             
         }
         .onAppear {
             
             for index in 1...10{
                 
                 posts.append(Post(imageURL: "p\(index)"))
                 
                 
             }
         }
    }
}

struct StaggeMainView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct PostCardView : View{
    
    var post : Post
    
    var body: some View{
        
        Image(post.imageURL)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .cornerRadius(15)
        
        
    }
}
