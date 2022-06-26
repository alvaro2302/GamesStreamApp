//
//  ProfileView.swift
//  GameStream
//
//  Created by Alvaro Cuiza on 12/6/22.
//

import SwiftUI

struct ProfileView: View {
    @State var nameUser = "Lorem"
    @State var imageProfile:UIImage = UIImage(named: "user")!
    var body: some View {
        ZStack{
            Color("Marine").ignoresSafeArea().navigationBarHidden(true).navigationBarBackButtonHidden(true)
            
            
            VStack{
                Text("Perfil").foregroundColor(.white).fontWeight(.bold).frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, alignment: .center).padding()
                VStack{
                    Image(uiImage: imageProfile).resizable().aspectRatio(contentMode: .fill).frame(width: 118.0, height: 118.0).clipShape(Circle())
                }.padding(EdgeInsets(top: 16, leading: 0, bottom: 32, trailing: 0))
                Text("Ajustes").foregroundColor(.white).fontWeight(.bold).frame(minWidth: 0, idealWidth: 100, maxWidth: .infinity, alignment: .leading).padding(.leading,18)
                Settings()
            }
            
        }.onAppear(
            perform: {
                print("review dates of user ")
                if returnUiImage(named:"fotoperfil") != nil {
                    imageProfile = returnUiImage(named:"fotoperfil")!
                }
                else
                {
                    print("no se encontro la foto de perfil guardada")
                }
            }
        )
        
    }
    func returnUiImage(named:String) -> UIImage?  {
     if let dir =  try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false){
         return  UIImage(contentsOfFile: URL(fileURLWithPath: dir.absoluteString).appendingPathComponent(named).path)
     }
    return nil
 }
}
struct Settings:View{
    @State var isToggleOn = true
    @State var isEditProfileViewActive = false
    var body: some View{
        VStack(spacing:4){
            Button(action: {
            }, label: {
                HStack{
                    Text("Cuenta").foregroundColor(.white)
                    Spacer()
                    Text(">").foregroundColor(.white)
                }.padding()
                
            }).background(Color("Blue-Gray")).clipShape(RoundedRectangle(cornerRadius: 2))
            Button(action: {
            }, label: {
                HStack{
                    Text("Notificaciones").foregroundColor(.white)
                    Spacer()
                    Toggle("",isOn: $isToggleOn).foregroundColor(.white)
                }.padding()
                
            }).background(Color("Blue-Gray")).clipShape(RoundedRectangle(cornerRadius: 2))
            Button(action: {
                isEditProfileViewActive = true
            }, label: {
                HStack{
                    Text("Editar Perfil").foregroundColor(.white)
                    Spacer()
                    Text(">").foregroundColor(.white)
                }.padding()
                
            }).background(Color("Blue-Gray")).clipShape(RoundedRectangle(cornerRadius: 2))
            Button(action: {
            
            }, label: {
                HStack{
                    Text("Califica esta aplicacion ").foregroundColor(.white)
                    Spacer()
                    Text(">").foregroundColor(.white)
                }.padding()
                
            }).background(Color("Blue-Gray")).clipShape(RoundedRectangle(cornerRadius: 2))
            NavigationLink(isActive: $isEditProfileViewActive, destination: {EditProfileView()}, label: {EmptyView()})
        }
        Spacer()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
