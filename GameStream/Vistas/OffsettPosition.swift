//
//  OffsettPosition.swift
//  GameStream
//
//  Created by Alvaro Cuiza on 26/6/22.
//

import SwiftUI

struct OffsettPosition: View {
    var body: some View {
        GeometryReader(content: { geometry in
            VStack{
    //            Offsets()
    //            Positions()
                Image("platzi").resizable().aspectRatio(contentMode: .fit).frame(width: geometry.size.width/2, height: geometry.size.height/3)
                
            }.frame( maxWidth: .infinity, maxHeight: .infinity)
        })
    }
}

struct Offsets: View{
    var body: some View{
        Image("platzi").resizable().aspectRatio(contentMode: .fill).frame(width: 200, height: 200).offset(x: 18.0, y: -15.0)
        Text("PLatzi").foregroundColor(.blue).bold()
    }
}
struct Positions: View{
    var body: some View{
        VStack {
            Image("platzi").resizable().aspectRatio(contentMode: .fit).frame(width: 100, height: 100).position(x: 100.0, y: 32.0)
        }
    }
}

struct OffsettPosition_Previews: PreviewProvider {
    static var previews: some View {
        OffsettPosition()
    }
}
