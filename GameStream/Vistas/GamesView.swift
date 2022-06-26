//
//  GamesView.swift
//  GameStream
//
//  Created by Alvaro Cuiza on 8/6/22.
//

import SwiftUI
import Kingfisher
struct GamesView: View {
    @ObservedObject var allGames = ViewModel()
    
    @State var gameViewIsActive:Bool = false
    @State var url:String  = ""
    @State var titulo:String = ""
    @State var studio:String = ""
    @State var calificacion:String = ""
    @State var anoPublicacion:String = ""
    @State var description:String = ""
    @State var tags:[String] = [""]
    @State var imgsUrl:[String] = [""]
    
    let formatGrid = [
        GridItem(.flexible()),GridItem(.flexible())]
    
    
    var body: some View {
        
        ZStack{
            Color("Marine").ignoresSafeArea()
            VStack{
                Text("Juegos").font(.title2).fontWeight(.bold).foregroundColor(.white).padding(EdgeInsets(top: 16, leading: 0, bottom: 64, trailing: 0))
                ScrollView{
                    LazyVGrid(columns: formatGrid, spacing: 8){
                        ForEach(allGames.gamesInfo ,id: \.self){
                            game in
                            
                            Button(action: {
                                url = game.videosUrls.mobile
                                titulo = game.title
                                studio = game.studio
                                calificacion = game.contentRaiting
                                anoPublicacion = game.publicationYear
                                description = game.description
                                tags = game.tags
                                imgsUrl = game.galleryImages
                                
                                print("title of game \(titulo)")
                                gameViewIsActive = true
                            }, label: {
                                KFImage(URL(string: game.galleryImages[0])!).resizable().aspectRatio(contentMode: .fit).clipShape(RoundedRectangle.init(cornerRadius: 4)).padding(.bottom,12)
                                    
                            })
                        }
                    }
                }
            }.padding(.horizontal,6.0)
            
            NavigationLink(isActive: $gameViewIsActive, destination: {GameView(url: url, titulo: titulo, studio: studio, calificacion: calificacion, anoPublicacion: anoPublicacion, description: description, tags: tags, imgsUrl: imgsUrl)}, label: {
                EmptyView()
            })
            
        }.navigationBarHidden(true).navigationBarBackButtonHidden(true).onAppear(
            perform: {
                print("first element JSON \(allGames.gamesInfo[0])")
                print("title of videogames from json \(allGames.gamesInfo[0].title)")
            }
           
        )
    }
}

struct GamesView_Previews: PreviewProvider {
    static var previews: some View {
        GamesView()
    }
}
