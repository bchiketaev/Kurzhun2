//
//  BrandsCollectionViewController.swift
//  Kurzhun2
//
//  Created by abc on 16/11/2020.
//

import UIKit

class BrandsCollectionViewController: UICollectionViewController {
    
    //MARK: Vars
    var bcategory: Category?

    override func viewDidLoad() {
        super.viewDidLoad()

    }


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        return UICollectionViewCell()
    }

    
}
