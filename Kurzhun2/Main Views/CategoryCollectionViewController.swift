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

    private let sectionInsets = UIEdgeInsets(top: 40.0, left: 20.0, bottom: 40.0, right: 20.0)
    private let itemsPerRow: CGFloat = 2
    
    
    
    override func viewDidLoad() {
            super.viewDidLoad()
        dataFromUrl.getAndParseData {
            self.collectionView.reloadData()
        }
        collectionView.delegate = self
        collectionView.dataSource = self
        
        }
    
    // MARK: UICollectionViewDataSource
    
    

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return dataFromUrl.category.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CategoryCollectionViewCell else {
            fatalError("Unable to dequeue PersonCell"   )
        }
        
   
        return cell
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    //    let nav = self.navigationController?.navigationBar
        
  //      nav?.barStyle = UIBarStyle.black
   //     nav?.tintColor = UIColor.yellow
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .scaleAspectFit
        
        let image = UIImage(named: "logo for ap")
        imageView.image = image
        
        navigationItem.titleView = imageView
        
        print(dataFromUrl.category.count)
        
    }
}
    
//    func getAndParseData () {
//        //Hit the API endpoint
//
//
//        let urlString = "https://kurjun.herokuapp.com/api/item/getcategory/?format=json"
//
//        let url = URL(string: urlString)
//
//        guard url != nil else {
//            return
//        }
//
//        let session = URLSession.shared
//
//        let dataTask = session.dataTask(with: url!) { (data, response, error) in
//
//            //Check for errors
//            if error == nil && data != nil {
//
//                // Parse JSON
//                let decoder = JSONDecoder()
//
//                do {
//
//
//                    let category = try decoder.decode([Category].self, from: data!)
//                    self.categoryArray = category
//
//
//
//                    print(self.categoryArray)
//                    print(self.categoryArray.count)
//
//
//                }
//                catch {
//                    print("Error in JSON parsing")
//                }
//            }
//        }
//
//        // Make the API Call
//        dataTask.resume()
//    }
    


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
