//
//  LoginPageViewHostingController.swift
//  Kurzhun2
//
//  Created by abc on 23/11/2020.
//

import UIKit
import SwiftUI
import Firebase


struct LoginPageView: View {
    
  var body: some View {
    NavigationView{
        
        LoginPageHome()
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
      
  }
}

struct LoginPageView_Preview: PreviewProvider {
    static var previews: some View {

        LoginPageView()
    }
}

struct LoginPageHome : View {
    
    @State var phone = ""
    @State var pass = ""
    @State private var secured: Bool = true
    
    var body: some View {
        ZStack {
            
            
            Color.black.opacity(0.03).edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center, spacing: 80) {
                
                    Image("new_blue_logo")
                        .resizable()
                        .frame(width: 200, height: 200)
                
                VStack(alignment: .center, spacing: 20) {

                    VStack(alignment: .center, spacing: 16) {
                        
                        HStack {
                            
                            TextField("Номер телефона", text: self.$phone)
                            
                            Image(systemName: "phone")
                                .resizable()
                                .frame(width: 20, height: 18)
                        }.keyboardType(.phonePad)
                    }.padding(.horizontal)
                    
                    Divider()
                    
                    VStack(alignment: .center, spacing: 16) {
                    
                        HStack{
                        
                        Image(systemName: "lock")
                            .resizable()
                            .frame(width: 15, height: 18)
                        
                       
//MARK: eye-button & password
                            if secured {
                                
                                // 2
                                SecureField("Пароль", text: $pass)
                                    
                            } else {
                                
                                // 3
                                TextField("Пароль", text: $pass)
                            }
                            
                            Button(action: {
                                self.secured.toggle()
                            }) {
                                
                                // 2
                                if secured {
                                    EyeImage(name: "eye-close")
                                } else {
                                    EyeImage(name: "eye-open")
                                }
                            }
                        
                        }

                    }.padding(.horizontal)
                    
                    Divider()
                    
                    Button(action: {}){
                        Text("Войти")
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 30)
                            
                    }.background(Color("Color1"))
                    .cornerRadius(6.0)
                    .foregroundColor(.white)
                    
                    
                    Button(action: {}) {
                        
                        Text("Забыли пароль?")
                    }.font(.system(size: 12))
                    
                    HStack(spacing:2) {
                        
                        Text("Ещё нет аккаунта?").font(.system(size: 12))
                        
                        NavigationLink(destination: RegistrationView()) {
                            
                            Text("Регистрация")
                        }.font(.system(size: 12))
                    }
                    
                    Button(action: {}){
                        
                        Text("Пропустить")
                    }.font(.system(size: 12))
                    
                    HStack {
                        Button(action: {}){
                            
                            Image("google-logo")
                                .resizable()
                                .frame(width: 50, height: 50)
                        }
                        
                        Button(action: {}){
                            
                            Image("appleIcon")
                                .resizable()
                                .frame(width: 50, height: 50)
                        }
                    }
                    
            }
                
                
           //     Spacer()
                
            }
            
        }
    }
}

//MARK: Eye-Button
struct EyeImage: View {
    
    // 1
    private var imageName: String
    init(name: String) {
        self.imageName = name
    }
    
    // 2
    var body: some View {
        Image(imageName)
            .resizable()
            .foregroundColor(.black)
            .frame(width: 20, height: 20)
    }
}



class LoginPageViewHostingController: UIHostingController<LoginPageView> {

    required init?(coder: NSCoder) {
        super.init(coder: coder,rootView: LoginPageView());
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
    
