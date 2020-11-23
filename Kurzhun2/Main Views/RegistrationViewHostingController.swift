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

struct RegistrationView_Preview: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}

struct RegistrationHome : View {
    
    var body: some View {
        
        Image("new_blue_logo")
            .resizable()
            .frame(width: 200, height: 200)
    }
}



//class RegistrationViewHostingController: UIHostingController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }

//}
