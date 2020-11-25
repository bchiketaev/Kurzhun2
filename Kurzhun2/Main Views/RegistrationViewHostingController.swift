//
//  RegistrationViewHostingController.swift
//  Kurzhun2
//
//  Created by abc on 23/11/2020.
//

import UIKit
import SwiftUI

struct RegistrationView: View {
  var body: some View {

        RegistrationHome()
    

  }
}

struct RegistrionView_Preview: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}

struct RegistrationHome: View {
    
  @State var pickerSelectedItem = 0
    
  var body: some View {
    
    ZStack {
        
        VStack (spacing: 16) {
            
            Picker(selection: $pickerSelectedItem, label: Text("")) {
                Text("Обычный пользователь").tag(0)
                Text("Магазин/Бизнес аккаунт").tag(1)
            }.pickerStyle(SegmentedPickerStyle())
       //     .padding(.vertical, 16)
            
            if pickerSelectedItem == 0 {
                regularUser()

            }
            else {
                bussinessAccount()
            }

            
        }.navigationBarTitle("Регистрация", displayMode: .inline)
        
        
    }
   

   
  }
}



struct regularUser : View {
    
    @State var fullName = ""
    @State var email = ""
    @State var address = ""
    @State var phone = ""
    @State var password = ""
    @State var repassword = ""
    
    @State private var secured: Bool = true


    var body: some View {
        
        ScrollView {
            
            HStack {
                
                VStack (spacing:16) {
                    
                    Group {
                        
                        HStack {
                        TextField("ФИО*", text: self.$fullName)
                            
                            Image(systemName: "person.fill")
                        }
                        Divider()
                        
                        HStack {
                        TextField("Email", text: self.$email)
                            
                            Image(systemName: "envelope.fill").foregroundColor(.black)
                        }
                        Divider()
                        
                        HStack {
                        TextField("Адрес", text: self.$address)
                            
                            Image(systemName: "mappin.and.ellipse")
                        }
                        Divider()
                        
                        HStack {
                        TextField("Номер телефона*", text: self.$phone)
                            
                            Image(systemName: "phone.fill")
                        }.keyboardType(.phonePad)
                        Divider()
                    }
                        
                    Group {
                        
                        HStack{
                        
                        Image(systemName: "lock")
                            .resizable()
                            .frame(width: 15, height: 18)
                        
                       
//MARK: eye-button & password
                            if secured {
                                
                                // 2
                                SecureField("Пароль", text: $password)
                                    
                            } else {
                                
                                // 3
                                TextField("Пароль", text: $password)
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
                        Divider()
                        
                        HStack{
                        
                        Image(systemName: "lock")
                            .resizable()
                            .frame(width: 15, height: 18)
                        
                       
//MARK: eye-button & password
                            if secured {
                                
                                // 2
                                SecureField("Повторите пароль", text: $repassword)
                                    
                            } else {
                                
                                // 3
                                TextField("Повторите пароль", text: $repassword)
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
                        Divider()
                        
                    }
                    
                    Group {
                        
                        Text("Регистрируясь, вы принимаете условия Пользовательского соглашения и Конфиденциальности на kurzhun.kg")
                            .font(.system(size: 12))
                        
                        Button(action: {}){
                            Text("Регистрация")
                                .padding(.vertical)
                                .frame(width: UIScreen.main.bounds.width - 30)
                                
                        }.background(Color("Color1"))
                        .cornerRadius(6.0)
                        .foregroundColor(.white)
                        
                        HStack(spacing:2) {
                            
                            Text("Уже есть аккаунт?").font(.system(size: 12))
                                
                            Button(action: {}){
                                
                                Text("Войти")
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
                    
                    
                }
            }.padding()
        }
        
        
        
    }
}

struct bussinessAccount : View {
    
    @State var name = ""
    @State var slogan = ""
    @State var description = ""
    @State var category = ""
    @State var region = ""
    @State var district = ""
    @State var address = ""
    @State var email = ""
    @State var phone = ""
    @State var password = ""
    @State var repassword = ""
    
    @State private var secured: Bool = true

    var body: some View {
        
        ScrollView {
            
            HStack {
                
                VStack (spacing:16) {
                    
                    Group {
                        
                        HStack {
                        TextField("Название*", text: self.$name)
                            
                            Image(systemName: "person.fill")
                        }
                        Divider()
                        
                        HStack {
                        TextField("Слоган/краткое описание", text: self.$slogan)
                            
                            Image(systemName: "person.fill").foregroundColor(.black)
                        }
                        Divider()
                        
                        HStack {
                        TextField("Описание бизнеса/магазина*", text: self.$description)
                            
                            Image(systemName: "exclamationmark.circle.fill")
                        }
                        Divider()
                        
                        HStack {
                        TextField("Выберите категорию*", text: self.$category)
                            
                            Image(systemName: "")
                        }
                        Divider()
                    }
                        
                    Group {
                        
                        HStack {
                        TextField("Выберите область*", text: self.$region)
                            
                            Image(systemName: "")
                        }
                        Divider()
                        
                        HStack {
                        TextField("Выберите район*", text: self.$district)
                            
                            Image(systemName: "")
                        }
                        Divider()
                        
                        HStack {
                        TextField("Адрес", text: self.$address)
                            
                            Image(systemName: "mappin.and.ellipse")
                        }
                        Divider()
                        
                        HStack {
                        TextField("Email", text: self.$email)
                            
                            Image(systemName: "envelope.fill").foregroundColor(.black)
                        }
                        Divider()
                        
                        HStack {
                        TextField("Номер телефона*", text: self.$phone)
                            
                            Image(systemName: "phone.fill")
                        }.keyboardType(.phonePad)
                        Divider()
                        
                    }
                    
                    Group {
                        
                        HStack{
                        
                        Image(systemName: "lock")
                            .resizable()
                            .frame(width: 15, height: 18)
                        
                       
//MARK: eye-button & password
                            if secured {
                                
                                // 2
                                SecureField("Пароль", text: $password)
                                    
                            } else {
                                
                                // 3
                                TextField("Пароль", text: $password)
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
                        Divider()
                        
                        HStack{
                        
                        Image(systemName: "lock")
                            .resizable()
                            .frame(width: 15, height: 18)
                        
                       
//MARK: eye-button & password
                            if secured {
                                
                                // 2
                                SecureField("Повторите пароль", text: $repassword)
                                    
                            } else {
                                
                                // 3
                                TextField("Повторите пароль", text: $repassword)
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
                        Divider()
                        
                    }
                    
                    Group {
                        
                        Text("Регистрируясь, вы принимаете условия Пользовательского соглашения и Конфиденциальности на kurzhun.kg")
                            .font(.system(size: 12))
                        
                        Button(action: {}){
                            Text("Регистрация")
                                .padding(.vertical)
                                .frame(width: UIScreen.main.bounds.width - 30)
                                
                        }.background(Color("Color1"))
                        .cornerRadius(6.0)
                        .foregroundColor(.white)
                        
                        HStack(spacing:2) {
                            
                            Text("Уже есть аккаунт?").font(.system(size: 12))
                                
                            Button(action: {}){
                                
                                Text("Войти")
                            }.font(.system(size: 12))
                            
                        }
                        
                        Button(action: {}){
                            
                            Text("Пропустить")
                        }.font(.system(size: 12))
                        
                    }
                    
                }
                
            }.padding()
        }
        
        
        
    }
}


//class RegistrationViewHostingController: UIHostingController <RegistrationView> {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
//
//}
