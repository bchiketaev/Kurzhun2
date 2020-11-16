//
//  CategoryCollectionViewController.swift
//  Kurzhun2
//
//  Created by abc on 9/11/2020.
//

import UIKit



class CategoryCollectionViewController: UICollectionViewController {

    
    //MARK: Vars
    var dataFromUrl = DataFromUrl()
  //  var categoryArray: [Category] = []

    //MARK: Conf for cells
    private let sectionInsets = UIEdgeInsets(top: 40.0, left: 20.0, bottom: 40.0, right: 20.0)
    private let itemsPerRow: CGFloat = 2
    
    
    
    override func viewDidLoad() {
            super.viewDidLoad()
        
        }
    
    // MARK: UICollectionViewDataSource
    
    

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return dataFromUrl.category.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CategoryCollectionViewCell else {
            fatalError("Unable to dequeue PersonCell"   )
        }
        
        cell.generateCell(dataFromUrl.category[indexPath.row])
   
        return cell
    }
    
    //MARK: UICollectionView Delegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "categoryToBrandsSeg", sender: dataFromUrl.category[indexPath.row])
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
      //Mark: Navigation Bar Color
    //    let nav = self.navigationController?.navigationBar
        
  //      nav?.barStyle = UIBarStyle.black
   //     nav?.tintColor = UIColor.yellow
        
        
      //Mark: Navigation Bar icon
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .scaleAspectFit
        
        let image = UIImage(named: "logo for ap")
        imageView.image = image
        
        navigationItem.titleView = imageView
        
      //Mark: Loading Categories
        dataFromUrl.getAndParseData {
            self.collectionView.reloadData()
        }
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    //MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "categoryToBrandsSeg" {
            let vc = segue.destination as! BrandsCollectionViewController
            vc.bcategory = sender as! Category
        }
        
    }
    
}


extension CategoryCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let withPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: withPerItem, height: withPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return sectionInsets.left
    }
}
