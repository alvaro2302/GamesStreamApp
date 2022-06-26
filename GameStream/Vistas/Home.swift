//
//  Home.swift
//  GameStream
//
//  Created by Alvaro Cuiza on 7/6/22.
//

import SwiftUI
import AVKit
struct Home: View {
    @State var tabSelected = 2
    init(){
        UITabBar.appearance().backgroundColor = UIColor(Color("tabBar-Color"))
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
        UITabBar.appearance().isTranslucent = true
    }
    var body: some View {
        TabView(selection:$tabSelected){
            ProfileView()
                .tabItem({
                
                    Image(systemName: "person.fill")
                    Text("Perfil")
                       
                }).tag(0)
            GamesView()
                .tabItem({
                
                    Image(systemName: "gamecontroller")
                    Text("juegos")
                       
                }).tag(1)
            ScreenHome().tabItem({
                
                    Image(systemName: "house")
                    Text("Home")
                       
                }).tag(2)
            
            FavoritesView()
                .tabItem({
                
                    Image(systemName: "heart")
                    Text("Favoritos")
                       
                }).tag(3)
        }.accentColor(.white)
    }
        
}

struct ScreenHome:View{
   
    var body: some View {
        ZStack {
            Color("Marine").ignoresSafeArea()
            VStack {
                Image("AppLogo").resizable().aspectRatio(contentMode: .fit).frame(width: 250).padding(.horizontal,11.0)

                ScrollView(showsIndicators: false){
                    SubModuleHome()

                }
            }.padding(.horizontal,18.0)
           
        }.navigationBarHidden(true).navigationBarBackButtonHidden(true)
        
    }
   
}

struct SubModuleHome:View {
    @State var isPlayerActive = false
    @State var isGameInfoEmpty = false
    @State var isGameViewActive = false
    @ObservedObject var gameSearch = SearchGame()
    @State var url:String  = ""
    @State var titulo:String = ""
    @State var studio:String = ""
    @State var calificacion:String = ""
    @State var anoPublicacion:String = ""
    @State var description:String = ""
    @State var tags:[String] = [""]
    @State var imgsUrl:[String] = [""]
    @State var textSearch:String = ""
    
    @State var device = UIDevice.current.model
    var body: some View {
        
        VStack {
            HStack{
                Button(action: {
                    watchGame(name:textSearch)
                    
                }, label: {
                    Image(systemName: "magnifyingglass").foregroundColor(textSearch.isEmpty ? Color(.yellow) : Color("Dark-cian"))
                }).alert(isPresented: $isGameInfoEmpty){
                    Alert(title: Text("Error"), message: Text("not is found Game"), dismissButton: .default(Text("understand")))
                }
                ZStack(alignment: .leading){
                    if(textSearch.isEmpty){
                        Text(device).foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0))
                    }
                    TextField("", text: $textSearch).foregroundColor(.white)
                }
            }.padding([.top,.leading,.bottom],11.0).background(Color("Blue-Gray")).clipShape(Capsule())

            Text("Los mas populares").font(.title3).foregroundColor(.white).bold().frame(minWidth: 0, maxWidth: .infinity,  alignment: .leading).padding(.top)
            ZStack{
                Button(action: {
                  watchGame(name: "the Witcher 3")
                    
                }, label: {
                    VStack(spacing: 0) {
                        Image("13-swiftuiapps-2105-thewitcher").resizable().scaledToFill()
                        Text("The witcher 3")
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading).background(Color("Blue-Gray"))
                    }
                })
                Image(systemName: "play.circle.fill").resizable().foregroundColor(.white).frame(width: 42, height: 42)
            }.frame(minWidth: 0, maxWidth: .infinity,  alignment: .center).padding(.vertical)
            
            Text("Categorias Sugeridas para ti").font(.title3).foregroundColor(.white).bold().frame(minWidth: 0, maxWidth: .infinity,  alignment: .leading)
            ScrollView(.horizontal,showsIndicators: false){
                if(device == "iPad")
                {
                    HStack{
                        Button(action: {}, label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 8.0).fill(Color("Blue-Gray")).frame(width: 320 , height: 180)
                                Image("fps").resizable().scaledToFit().frame(width: 84, height: 84)
                                
                            }
                        })
                        Button(action: {}, label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 8.0).fill(Color("Blue-Gray")).frame(width: 320, height: 180)
                                Image("rpg-text").resizable().scaledToFit().frame(width: 84, height: 84)
                                
                            }
                        })
                        Button(action: {}, label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 8.0).fill(Color("Blue-Gray")).frame(width: 320, height: 180)
                                Image("open-world-icon").resizable().scaledToFit().frame(width: 84, height: 84)
                                
                            }
                        })
                    }
                }
                else
                {
                    HStack{
                        Button(action: {}, label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 8.0).fill(Color("Blue-Gray")).frame(width: 160, height: 90)
                                Image("fps").resizable().scaledToFit().frame(width: 42, height: 42)
                                
                            }
                        })
                        Button(action: {}, label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 8.0).fill(Color("Blue-Gray")).frame(width: 160, height: 90)
                                Image("rpg-text").resizable().scaledToFit().frame(width: 42, height: 42)
                                
                            }
                        })
                        Button(action: {}, label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 8.0).fill(Color("Blue-Gray")).frame(width: 160, height: 90)
                                Image("open-world-icon").resizable().scaledToFit().frame(width: 42, height: 42)
                                
                            }
                        })
                    }
                }
                
            }
            Text("Recomendados para ti").font(.title3).foregroundColor(.white).bold().frame(minWidth: 0, maxWidth: .infinity,  alignment: .leading)
            ScrollView(.horizontal,showsIndicators: false){
                HStack{
                    Button(action: {
                        watchGame(name: "spiderman")
                    }, label: {
                        Image("13-swiftuiapps-2105-spiderman").resizable().scaledToFit().frame(width: 240, height: 135)
                    })
                    
                    Button(action: {
                        watchGame(name: "battlefield")
                    }, label: {
                        Image("13-swiftuiapps-2105-battkefield").resizable().scaledToFit().frame(width: 240, height: 135)
                    })
                    Button(action: { watchGame(name: "assassins creed")}, label: {
                        Image("13-swiftuiapps-2105-assassins_creed").resizable().scaledToFit().frame(width: 240, height: 135)
                    })
                }
            }
        }
        
        NavigationLink(destination: GameView(url: url, titulo: titulo, studio: studio, calificacion: calificacion, anoPublicacion: anoPublicacion, description: description, tags: tags, imgsUrl: imgsUrl), isActive: $isGameViewActive, label: {
            EmptyView()
        })
    }
    func watchGame(name:String){
        
        gameSearch.search(gameName: name)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
            print("cantidad E: \(gameSearch.gameInfo.count)")
            if gameSearch.gameInfo.count == 0 {
                isGameInfoEmpty = true
            }
            else{
                url = gameSearch.gameInfo[0].videosUrls.mobile
                titulo = gameSearch.gameInfo[0].title
                studio = gameSearch.gameInfo[0].studio
                calificacion = gameSearch.gameInfo[0].contentRaiting
                anoPublicacion = gameSearch.gameInfo[0].publicationYear
                description = gameSearch.gameInfo[0].description
                tags = gameSearch.gameInfo[0].tags
                imgsUrl = gameSearch.gameInfo[0].galleryImages
                isGameViewActive = true
                
            }
        }
    }
}
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .previewDevice("iPhone 12")
       
    }
}
