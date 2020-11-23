//
//  LoginPageViewHostingController.swift
//  Kurzhun2
//
//  Created by abc on 23/11/2020.
//

import UIKit
import SwiftUI

struct LoginPageView: View {
  var body: some View {
    
    LoginPageHome()
      
  }
}

struct LoginPageView_Preview: PreviewProvider {
    static var previews: some View {
        LoginPageView()
    }
}



struct LoginPageHome : View {
    
    @State var email = ""
    @State var pass = ""
    @State private var secured: Bool = true
    @State var height: CGFloat = 0
    
    var body: some View {
        
        // now were going to adjust view when keyboard appears...
        // enabling scroll view based on height...
                  
        // for phones having lesser screen size....
        // were enabling scroll view for all time....
        
        ScrollView(UIScreen.main.bounds.height < 750 ? .vertical : (self.height == 0 ? .init() : .vertical), showsIndicators: false) {
            
            ZStack {
                            
                VStack(alignment: .center, spacing: 80) {
                    
    //                HStack {
                        Image("new_blue_logo")
                            .resizable()
                            .frame(width: 200, height: 200)
                    
                  //          .offset(x: 0, y: 30)
                 //   }
                    VStack(alignment: .center, spacing: 20) {

                        VStack(alignment: .center, spacing: 16) {
                            
                            HStack {
                                
                                TextField("Номер телефона", text: self.$email)
                                
                                Image(systemName: "phone")
                                    .resizable()
                                    .frame(width: 20, height: 18)
                            }
                        }.padding(.horizontal)
                        
                        Divider()
                        
                        VStack(alignment: .center, spacing: 16) {
                        
                            HStack{
                            
                            Image(systemName: "lock")
                                .resizable()
                                .frame(width: 15, height: 18)
                            
                           // SecureField("Пароль", text: self.$pass)
                           
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
                        
                        
                        Button(action: {}){
                            
                            Text("Забыли пароль?")
                        }.font(.system(size: 12))
                        
                        HStack(spacing:2) {
                            
                            Text("Ещё нет аккаунта?").font(.system(size: 12))
                            
                            Button(action: {}){
                                
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
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
                
            }
        }
        //moving view up...
        .padding(.bottom, self.height)
        .background(Color.black.opacity(0.03).edgesIgnoringSafeArea(.all))
        .edgesIgnoringSafeArea(.all)
        .onAppear {
                      
                      NotificationCenter.default.addObserver(forName: UIResponder.keyboardDidShowNotification, object: nil, queue: .main) { (not) in
                          
                          let data = not.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue
                          
                          let height = data.cgRectValue.height - (UIApplication.shared.windows.first?.safeAreaInsets.bottom)!
                          
                          self.height = height
                          
                          // removing outside safeaera height...
                          print(height)
                      }
                      
                      NotificationCenter.default.addObserver(forName: UIResponder.keyboardDidHideNotification, object: nil, queue: .main) { (_) in
                          
                          print("hidden")
                          
                          self.height = 0
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
    

    /*
    // MARK: - Navigation
 
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
