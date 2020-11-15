//
//  Category.swift
//  Kurzhun2
//
//  Created by abc on 9/11/2020.
//

import UIKit
import Foundation

//MARK: Download category from firebase
//
//func downloadCategoriesFromFirebase(completion: @escaping (_ categoryArray: [Category]) -> Void) {
//
//    var categoryArray: [Category] = []
//
//    FirebaseReference(.Category).getDocuments { (snapshot, error) in
//
//        guard let snapshot = snapshot else {
//            completion(categoryArray)
//            return
//        }
//
//        if !snapshot.isEmpty {
//
//            for categoryDict in snapshot.documents {
//                categoryArray.append(Category(_dictionary: categoryDict.data() as NSDictionary))
//            }
//        }
//
//        completion(categoryArray)
//    }
//}

//MARK: Helpers
//
//func categoryDictionaryFrom(_ category: Category) -> NSDictionary {
//
//    return NSDictionary(objects: [category.id, category.name, category.imageName], forKeys: [kOBJECTID as NSCopying, kNAME as NSCopying, kIIMAGENAME as NSCopying])
//}

struct Category: Decodable {
    
    var id: Int
    var nameEn: String
    var nameRus: String
    var nameKg: String
    var icon: String
    
}
