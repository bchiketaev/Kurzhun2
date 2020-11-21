//
//  BrandsCollectionViewCell.swift
//  Kurzhun2
//
//  Created by abc on 16/11/2020.
//

import UIKit
import SwiftUI




//Extension to download images from url
extension UIImageView {
    func brandsImageDownloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit ) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func brandsImageDownloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit ) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

class BrandsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var brandName: UILabel!
    @IBOutlet weak var brandSlogan: UILabel!
    
    
    
    func generateBrandsCell(_ brand: MyResult) {
        brandName.text = brand.username
        brandSlogan.text = brand.slogan
        
        let urlString = brand.logo
       let url = URL(string: urlString!)
        
        imageView.downloaded(from: url!)
        
    }
        
}
