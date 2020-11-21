//
//  BrandsCollectionViewController.swift
//  Kurzhun2
//
//  Created by abc on 16/11/2020.
//

import UIKit

class BrandsCollectionViewController: UICollectionViewController {
    
    //MARK: Vars
    var brandsArray: [Brands] = []
    var downloadBrands = DownloadBrands()
    var category: Category?
    var categoryId: Int?

    
    //MARK: Cell conf
    private let sectionInsets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
    private let itemsPerRow: CGFloat = 2
    
    
    //MARK: View Lifecycle
    
    override func viewDidLoad() {
            super.viewDidLoad()
            self.title = category?.nameRus
            self.categoryId = (category?.id)!

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        if category != nil {
//        loadBrands(categoryId)
//        }
        downloadBrands.getAndParseData(type: categoryId!) {
            self.collectionView.reloadData()
        }
        
        collectionView.delegate = self
        collectionView.dataSource = self
                
    }
    
    //MARK: Load items
//    private func loadBrands(type: Int) {
//        downloadBrands.getAndParseData(type) {
//            self.collectionView.reloadData()
//        }
//    }

    

    // MARK: UICollectionViewDataSource

//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
/*EDITED*/        print(downloadBrands.brandsArray.count)
        
        return downloadBrands.brandsArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "brandsCell", for: indexPath) as? BrandsCollectionViewCell else {
            fatalError("Unable to dequeue PersonCell"   )
        }
        cell.layer.cornerRadius = 6
        cell.layer.borderWidth = 1.0
        cell.layer.borderColor = UIColor.gray.cgColor

        cell.generateBrandsCell(downloadBrands.brandsArray[indexPath.row])
        
   
        return cell
    }
    
    
}

extension BrandsCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let withPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: withPerItem, height: withPerItem * 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return sectionInsets.left
    }
}
