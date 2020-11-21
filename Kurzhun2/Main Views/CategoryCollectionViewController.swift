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

    //MARK: Conf for cells
    
    private let sectionInsets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
    private let itemsPerRow: CGFloat = 2
    
    
    
    override func viewDidLoad() {
            super.viewDidLoad()
        
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
    
    // MARK: UICollectionViewDataSource
    
    

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return dataFromUrl.categoryArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CategoryCollectionViewCell else {
            fatalError("Unable to dequeue PersonCell"   )
        }
        cell.layer.cornerRadius = 6
        cell.layer.borderWidth = 1.0
        cell.layer.borderColor = UIColor.gray.cgColor
            
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        cell.layer.shadowRadius = 2.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.layer.cornerRadius).cgPath
        
        cell.generateCell(dataFromUrl.categoryArray[indexPath.row])
   
        return cell
    }
    
    //MARK: UICollectionView Delegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "categoryToBrandsSeg", sender: dataFromUrl.categoryArray[indexPath.row])
    }
    
    
    
    //MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "categoryToBrandsSeg" {
            let vc = segue.destination as! BrandsCollectionViewController
            vc.category = sender as! Category
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
