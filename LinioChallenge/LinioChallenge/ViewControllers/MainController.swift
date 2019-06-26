//
//  MainController.swift
//  LinioChallenge
//
//  Created by Pablo Ramirez on 6/25/19.
//  Copyright © 2019 Pablo Ramirez. All rights reserved.
//

import UIKit

class MainController: UIViewController{

    @IBOutlet weak var headerCollection: UICollectionView!
    @IBOutlet weak var favoritesLabel: UILabel!
    @IBOutlet weak var footerCollection: UICollectionView!
    @IBOutlet weak var plusBarButton: UIBarButtonItem!
    
    var mainViewModel: MainViewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 249.0/255.0, green: 245.0/255.0, blue: 244.0/255.0, alpha: 1)

        // Do any additional setup after loading the view.
        headerCollection.register(UINib(nibName: "HeaderViewCell", bundle: nil), forCellWithReuseIdentifier: "HeaderCell")
        headerCollection.delegate = self
        headerCollection.dataSource = self
        
        footerCollection.register(UINib(nibName: "FooterViewCell", bundle: nil), forCellWithReuseIdentifier: "FooterCell")
        footerCollection.delegate = self
        footerCollection.dataSource = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        mainViewModel.mainDelegate = self
        mainViewModel.getFavoritesService()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MainController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension MainController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case headerCollection:
            return mainViewModel.favorites.count
        case footerCollection:
            return mainViewModel.productsArray.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case headerCollection:
            print("header collection")
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeaderCell", for: indexPath) as! HeaderViewCell
            
            cell.initCell(favorite: mainViewModel.favorites[indexPath.row])
            return cell
        case footerCollection:
            print("footer collection")
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FooterCell", for: indexPath) as! FooterViewCell
            
            cell.initCell(product: mainViewModel.productsArray[indexPath.row])
            return cell
        default:
            
            return UICollectionViewCell()
        }
    }
}

extension MainController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case headerCollection:
            return CGSize(width: headerCollection.frame.width * 0.48, height: headerCollection.frame.height * 0.9)
        case footerCollection:
            return CGSize(width: footerCollection.frame.width * 0.48, height: footerCollection.frame.height * 0.4)
        default:
            return CGSize.zero
        }
    }
}

extension MainController: MainProtocol{
    
    func didStartService() {
        self.showLoadingView()
    }
    
    func didSuccessService() {
        self.dismissLoadingView()
        
        favoritesLabel.text = "Todos mis favoritos (\(mainViewModel.productsArray.count))"
        
        headerCollection.reloadData()
        footerCollection.reloadData()
    }
    
    func didErrorService() {
        let alert = UIAlertController(title: "Error", message: "Ocurrió un error en la petición del servicio.", preferredStyle: .alert)
        
        let retryAction = UIAlertAction(title: "Reintentar", style: .default,
                                       handler: { (action:UIAlertAction) -> Void in
                                        
            self.mainViewModel.getFavoritesService()
        })
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .default) { (action: UIAlertAction) -> Void in
            
            alert.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(retryAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true, completion: nil)
    }
}
