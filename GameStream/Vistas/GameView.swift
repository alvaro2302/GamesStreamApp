//
//  GameView.swift
//  GameStream
//
//  Created by Alvaro Cuiza on 11/6/22.
//

import SwiftUI
import AVKit
import Kingfisher
struct GameView: View {
    var url:String
    var titulo:String
    var studio:String
    var calificacion:String
    var anoPublicacion:String
    var description:String
    var tags:[String]
    var imgsUrl:[String]
    
    var body: some View {
        
        ZStack{
            Color("Marine").ignoresSafeArea()
            VStack{
                Video(url:url).frame(height:300)
                
                ScrollView{
                    VideoInfo(title:titulo,studio:studio,calification:calificacion,yearPublish:anoPublicacion,description:description,tags:tags)
                    GalleryImages(imgsGallery:imgsUrl)
                    Comentaries()
                }.frame( maxWidth: .infinity)
            }
            
        }
    }
}
struct Video:View{
    var url:String
    var body: some View{
        VideoPlayer(player: AVPlayer(url: URL(string: url)!)).ignoresSafeArea()
        
    }
}

struct VideoInfo:View{
    var title:String
    var studio:String
    var calification:String
    var yearPublish:String
    var description:String
    var tags:[String]
    var body: some View{
        VStack(alignment: .leading){
            Text("\(title)").foregroundColor(.white).font(.largeTitle).padding(.leading)
            HStack{
                Text("\(studio)").foregroundColor(.white).font(.subheadline).padding(.top,5).padding(.leading)
                Text("\(calification)").foregroundColor(.white).font(.subheadline).padding(.top,5)
                Text("\(yearPublish)").foregroundColor(.white).font(.subheadline).padding(.top,5)
            }
            Text("\(description)").foregroundColor(.white).font(.subheadline).padding(.top,5).padding(.leading)
            HStack{
                ForEach(tags,id: \.self){
                    tag in
                    Text("#\(tag)").foregroundColor(.white).font(.subheadline).padding(.top,4).padding(.leading)
                }
            }
           
            
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct GalleryImages:View{
    var imgsGallery:[String]
    let formGrid = [
        GridItem(.flexible())
    ]
    var body: some View{
        VStack(alignment: .leading){
            Text("Gallery").foregroundColor(.white).font(.largeTitle).padding(.leading)
            ScrollView(.horizontal){
                LazyHGrid(rows: formGrid, spacing: 8){
                    ForEach(imgsGallery,id: \.self){
                        imgGallery in
                        KFImage(URL(string: imgGallery)!).resizable().aspectRatio(contentMode: .fill)
                    }
                }
            }.frame(height: 180)
        }.frame(maxWidth: .infinity,  alignment: .leading)
    }
}
struct Comentaries:View{
    
    var body:some View{
        VStack(alignment:.leading){
            Text("Comentarios").foregroundColor(.white).font(.largeTitle).padding(.leading)
            VStack{
                ZStack(alignment:.leading){
                    Color("Blue-Gray")
                    VStack(alignment:.leading){
                        HStack(){
                            Image("user").resizable().aspectRatio(contentMode: .fit).frame(width: 40, height: 40, alignment: .leading)
                            VStack(alignment:.leading){
                                Text("Geoff Atto").foregroundColor(.white).font(.title2).fontWeight(.bold)
                                Text("Hace 7 dias").foregroundColor(.white).font(.subheadline)
                                
                            }.padding()
                        }.padding()
                        Text("He visto como media tiene una gran calificacion y estoy completamente de acuerdo.Es el mejor juego que he jugadi sin ninguna duda , combina una buena trama con una buenesima experiencia de juego libre gracias a su inmenso mapa y actividades").foregroundColor(.white).padding(.horizontal,8).padding(.bottom,10)
                    }
                    
                }
               
            }.frame(maxWidth: .infinity, alignment: .leading).cornerRadius(8).padding(.horizontal,10)
            VStack{
                ZStack(alignment:.leading){
                    Color("Blue-Gray")
                    VStack(alignment:.leading){
                        HStack(){
                            Image("user").resizable().aspectRatio(contentMode: .fit).frame(width: 40, height: 40, alignment: .leading)
                            VStack(alignment:.leading){
                                Text("Geoff Atto").foregroundColor(.white).font(.title2).fontWeight(.bold)
                                Text("Hace 7 dias").foregroundColor(.white).font(.subheadline)
                                
                            }.padding()
                        }.padding()
                        Text("He visto como media tiene una gran calificacion y estoy completamente de acuerdo.Es el mejor juego que he jugadi sin ninguna duda , combina una buena trama con una buenesima experiencia de juego libre gracias a su inmenso mapa y actividades").foregroundColor(.white).padding(.horizontal,8).padding(.bottom,10)
                    }
                    
                }
               
            }.frame(maxWidth: .infinity, alignment: .leading).cornerRadius(8).padding(.horizontal,10)
            
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}
struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(url: "ejemplo",titulo:"Sonic The Hedgehog",
            studio: "Sega",
            calificacion: "E+",
            anoPublicacion: "1991",
description: "Juego de Sega Genesis publicado en 1991 con más de 40 millones de copias vendidas actualmente",
            tags:["plataformas","mascota"],
            imgsUrl: [ "https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg"
        ])
    }
}
