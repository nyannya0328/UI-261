//
//  StaggeGridCard.swift
//  UI-261
//
//  Created by nyannyan0328 on 2021/07/18.
//

import SwiftUI

struct StaggeGridCard<Content : View,T : Identifiable>: View where T : Hashable {
    
    var content : (T)->Content
    var list :[T]
    var showIndicator : Bool
    var spacing : CGFloat
    var columns : Int
    
    
    init(columns : Int,spacing : CGFloat = 10,showIndicator : Bool = false,list : [T],@ViewBuilder content : @escaping(T) ->Content){
        
        
        self.columns = columns
        self.spacing = spacing
        self.showIndicator = showIndicator
        self.list = list
        self.content = content
        
    }
    
    func setUP()->[[T]]{
        
        
        var gridArray : [[T]] = Array(repeating: [], count: columns)
        
        
        var currentIndex : Int = 0
        
        
        for object in list{
            
            gridArray[currentIndex].append(object)
            
            if currentIndex == (columns - 1){
                
                currentIndex = 0
            }
            
            else{
                
                
                
                currentIndex += 1
            }
            
            
            
        }
        
        
        return gridArray
        
    }
    
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: showIndicator) {
            
            HStack(alignment:.top){
                
                ForEach(setUP(),id:\.self){columnsData in
                    
                    LazyVStack(spacing:spacing){
                        
                        
                        ForEach(columnsData){object in
                            
                            
                            content(object)
                        }
                        
                    }
                    
                    
                }
            }
            .padding(.vertical)
        }
    }
}

struct StaggeGridCard_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
