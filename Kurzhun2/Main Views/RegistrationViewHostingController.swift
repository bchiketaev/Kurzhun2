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
  var body: some View {
    
    VStack {
        Text("Hello world!")
    }.navigationBarTitle("Регистрация", displayMode: .inline)

   
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
