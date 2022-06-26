//
//  EditProfileView.swift
//  GameStream
//
//  Created by Alvaro Cuiza on 12/6/22.
//

import SwiftUI

struct EditProfileView: View {
    
    @State var imageUser:Image? = Image("user")
    @State var isCameraActive:Bool = false
    var body: some View {
        ZStack{
            Color("Marine").ignoresSafeArea()
            ScrollView{
                Text("Editar Perfil").foregroundColor(.white).bold()
                VStack{
                    
//
                    Button(action:{
                        isCameraActive = true
                        
                    },label: {
                        
                        ZStack {
                            imageUser!.resizable().aspectRatio(contentMode: .fill).frame(width: 118, height: 118).clipShape(Circle()).sheet(isPresented: $isCameraActive, content: {
                                SUImagePickerView(sourceType: .camera, image: self.$imageUser, isPresented: $isCameraActive)
                            })
                            Image(systemName: "camera").foregroundColor(.white)
                        }
                    })
                    
                    
                }.padding(.bottom,18.0)
                EditProfile()
            }
        }
    }
}

struct EditProfile:View {
    @State var email:String = ""
    @State var password:String = ""
    @State var name:String = ""
    var body: some View{
        VStack(alignment: .leading) {
            
            Text("Correo electrónico").foregroundColor(Color("Dark-cian"))
            ZStack(alignment: .leading){
                if email.isEmpty {
                    Text("example@gmail.com").font(.caption).accentColor(.gray)
                }
                TextField("",text:$email).foregroundColor(.white)
            }
            Divider().frame( height: 1).background(Color("Dark-cian"))
            
            Text("Contraseña").foregroundColor(.white)
            ZStack(alignment: .leading){
                if password.isEmpty {
                    Text("ingrese su contraseñas").font(.caption).foregroundColor(.gray)
                }
                SecureField("",text:$password).foregroundColor(.white)
            }
            Divider().frame( height: 1).background(Color("Dark-cian"))
            
            Text("Nombre").foregroundColor(.white)
            ZStack(alignment: .leading){
                if name.isEmpty {
                    Text("ingrese su nombre de usuario").font(.caption).foregroundColor(.gray)
                }
                TextField("",text:$name).foregroundColor(.white)
            }
            Divider().frame( height: 1).background(Color("Dark-cian")).padding(.bottom,32)
            
            Button(action: {updateDate()}, label: {
                Text("Actualizar Datos").fontWeight(.bold).foregroundColor(.white).frame( maxWidth: .infinity, alignment: .center).padding(EdgeInsets(top: 11, leading: 14, bottom: 11, trailing: 14)).overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("Dark-cian"),lineWidth: 1.5).shadow(color: .white, radius: 3))
            }).padding(.bottom)
            
        }.padding(.horizontal,42.0)
    }
    
    func updateDate(){
        let objectupdate = SaveData()
        let resultado = objectupdate.saveData(email: email, password: password, name: name)
        print("its save dates sucess? \(resultado) ")
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
