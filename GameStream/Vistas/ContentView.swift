//
//  ContentView.swift
//  GameStream
//
//  Created by Alvaro Cuiza on 5/6/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack{
                Spacer()
                Color( red: 29/255, green: 36/255, blue: 63/255, opacity: 1.0).ignoresSafeArea()
                VStack{
                    Image("AppLogo").resizable().aspectRatio(contentMode: .fit).frame(width: 250).padding(.bottom,42.0).offset(x: 0, y: 10)
                    RegisterAndLoginView()
                }
            }.navigationBarHidden(true)
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct RegisterAndLoginView :View {
    @State var isLogin:Bool = true
    var body: some View{
        VStack {
            HStack{
                
                Spacer()
                Button(action: {isLogin = true}, label:{
                    Text("INICIA SESION").fontWeight(.bold).foregroundColor(isLogin ? .white : .gray)
                })
                Spacer()
                Button(action: {isLogin = false}, label: {
                    Text("REGISTRATE").fontWeight(.bold).foregroundColor(isLogin ? .gray : .white)
                })
                Spacer()
                
                
               
            }
            Spacer(minLength: 42)
            if(isLogin)
            {
                LoginView()
            }
            else
            {
                RegisterView()
            }
        }
    }
}

struct LoginView :View  {
    @State var email = ""
    @State var password = ""
    @State var isHome:Bool = false
    @State var isValidate:Bool = false
    var body: some View {
        ScrollView{
            VStack{
                VStack(alignment: .leading) {
                    Text("Correo electronico").foregroundColor(Color("Dark-cian"))
                   
                    ZStack(alignment: .leading) {
                        if(email.isEmpty)
                        {
                            
                            Text("ejemplor@gmail.com").font(.caption).accentColor(.gray)
                        }
                        TextField("", text: $email)
                    }
                    Divider().frame(height: 1).background(Color("Dark-cian")).padding(.bottom)
                }
                VStack(alignment: .leading) {
                    Text("Contraseña").foregroundColor(.white).fontWeight(.bold)
                   
                    ZStack(alignment: .leading) {
                        if(password.isEmpty)
                        {
                            
                            Text("password").font(.caption).foregroundColor(.gray)
                        }
                        SecureField("", text: $password)
                    }
                    Divider().frame(height: 1).background(.white).padding(.bottom)
                    Text("¿Olvidaste tu contraseña?").font(.footnote).frame(width: 300, alignment: .trailing).foregroundColor(Color("Dark-cian")).padding(.bottom)
                   
                }
                Button(action:{ login(&isHome,email: &email,password: &password,isValidate:&isValidate)}, label: {
                    Text("INICIAR SESION").fontWeight(.bold).foregroundColor(.white).frame( maxWidth: .infinity, alignment: .center).padding(EdgeInsets(top: 11, leading: 14, bottom: 11, trailing: 14)).overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("Dark-cian"),lineWidth: 1.5).shadow(color: .white, radius: 7))
                }).padding(.top,20).alert(isPresented: $isValidate){
                    Alert(title: Text("Error"), message: Text("not is validate user or password"), dismissButton: .default(Text("understand")))
                }
                Text("Iniciar sesion con redes sociales").foregroundColor(.white).frame( maxWidth: .infinity, alignment: .center).padding(.top, 50.0)
               
                
                HStack{
                    Spacer()
                    Button(action: loginWithFacebook, label: {
                        Text("Facebook").fontWeight(.bold).foregroundColor(.white).frame(maxWidth: .infinity, alignment: .center).padding(EdgeInsets(top: 11, leading: 0, bottom: 7, trailing: 0))
                    }).background(Color(red: 46/255, green: 58/255, blue: 91/255)).cornerRadius(7.0)
                    Spacer()
                    Button(action: loginWithTwitter, label: {
                        Text("Twitter").fontWeight(.bold).foregroundColor(.white).frame(maxWidth: .infinity, alignment: .center).padding(EdgeInsets(top: 11, leading: 0, bottom: 7, trailing: 0))
                    }).background(Color(red: 46/255, green: 58/255, blue: 91/255)).cornerRadius(7.0)
                    Spacer()
                    
                
                }.padding(.top,10)
                
            }.padding(.horizontal,77.0)
            NavigationLink(destination: Home(), isActive: $isHome, label: {
                EmptyView()
            })
        }
       
    }
}


func login(_ statehome:inout Bool, email:inout String , password:inout String,isValidate:inout Bool) {
    let objectupdate = SaveData()
    let result = objectupdate.validateData(email: email, password: password)
    if(result){
        statehome = true
    }
    else
    {
        isValidate = true
    }
  
    print("login button now ")
}
func loginWithFacebook(){
    print("login with Facebook")
}
func loginWithTwitter(){
    print("login with Twitter")
}
struct RegisterView :View {
    @State var email = ""
    @State var password = ""
    @State var ConfirmPassword = ""
    @State var isValidate = false
    @State var isCorrect = false
    var body: some View{
        ScrollView{
            VStack(alignment:.center){
                Text("elige una foto de perfil").fontWeight(.bold).foregroundColor(.white)
                Text("Puedes cambiar o elegirla mas aadelante").font(.footnote).fontWeight(.light).foregroundColor(.gray)
                Button(action: tomarFoto , label: {
                    ZStack
                    {
                        Image("user").resizable().aspectRatio(contentMode: .fit).frame(width: 80, height: 80)
                        Image(systemName: "camera").resizable().aspectRatio(contentMode: .fit).frame(width: 35, height: 35, alignment: .center).foregroundColor(.white)
                    }
                    
                })
                
                
            }.padding(.bottom)
            VStack(alignment: .leading) {
                Text("Correo electronico*").foregroundColor(Color("Dark-cian"))

                ZStack(alignment: .leading) {
                    if(email.isEmpty)
                    {

                        Text("ejemplor@gmail.com").font(.caption).accentColor(.gray)
                    }
                    TextField("", text: $email)
                }
                Divider().frame(height: 1).background(Color("Dark-cian")).padding(.bottom)
            }
            VStack(alignment: .leading) {
                Text("Contraseña").foregroundColor(.white).fontWeight(.bold)

                ZStack(alignment: .leading) {
                    if(password.isEmpty)
                    {

                        Text("password").font(.caption).foregroundColor(.gray)
                    }
                    SecureField("", text: $password)
                }
                Divider().frame(height: 1).background(.white).padding(.bottom)
               

            }
            VStack(alignment: .leading) {
                Text("Confirmar Contraseña*").foregroundColor(.white).fontWeight(.bold)

                ZStack(alignment: .leading) {
                    if(ConfirmPassword.isEmpty)
                    {

                        Text("rewrite to  password").font(.caption).foregroundColor(.gray)
                    }
                    SecureField("", text: $ConfirmPassword)
                }
                Divider().frame(height: 1).background(.white).padding(.bottom)
               

            }
            Button(action: {registrate(email: &email, password: &password,repassword:&ConfirmPassword, isValidate: &isValidate,isCorrect:&isCorrect)}, label: {
                Text("REGISTRATE").fontWeight(.bold).foregroundColor(.white).frame( maxWidth: .infinity, alignment: .center).padding(EdgeInsets(top: 11, leading: 14, bottom: 11, trailing: 14)).overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("Dark-cian"),lineWidth: 1.5).shadow(color: .white, radius: 7))
            }).padding(.top,20).alert(isPresented: $isValidate){
                if isCorrect {
                    return Alert(title: Text("Succesfull"), message: Text("registation correct"), dismissButton: .default(Text("understand")))
                }
                else{
                    return Alert(title: Text("Error"), message: Text("not is posible save data"), dismissButton: .default(Text("understand")))
                }
                
            }
            Text("Iniciar sesion con redes sociales").foregroundColor(.white).frame( maxWidth: .infinity, alignment: .center).padding(.top, 50.0)


            HStack{
                Spacer()
                Button(action: loginWithFacebook, label: {
                    Text("Facebook").fontWeight(.bold).foregroundColor(.white).frame(maxWidth: .infinity, alignment: .center).padding(EdgeInsets(top: 11, leading: 0, bottom: 7, trailing: 0))
                }).background(Color(red: 46/255, green: 58/255, blue: 91/255)).cornerRadius(7.0)
                Spacer()
                Button(action: loginWithTwitter, label: {
                    Text("Twitter").fontWeight(.bold).foregroundColor(.white).frame(maxWidth: .infinity, alignment: .center).padding(EdgeInsets(top: 11, leading: 0, bottom: 7, trailing: 0))
                }).background(Color(red: 46/255, green: 58/255, blue: 91/255)).cornerRadius(7.0)
                Spacer()


            }.padding(.top,10)
            
           
            
        }.padding(.horizontal,77.0)
        
    }
}
func tomarFoto(){
    print("tomar Foto")
}
func registrate(email:inout String , password:inout String, repassword:inout String ,isValidate:inout Bool,isCorrect:inout Bool)
{
    let objectupdate = SaveData()
    let result = objectupdate.saveData(email: email, password: password, name: "userDefault")
    isValidate = true
    if(!result || password != repassword ){
        isCorrect = false
    }else{
        isCorrect = true
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12")
            .previewInterfaceOrientation(.portrait)
        
    }
}
