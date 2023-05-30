//
//  HomeCollectionViewController.swift
//  Sports App
//
//  Created by Mac on 20/05/2023.
//

import UIKit



class HomeCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var imgsList:[String] = ["Football","Basketball","Cricket","Tennis"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

   
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SportCell", for: indexPath) as! HomeCollectionViewCell
    
        cell.sportImg.image = UIImage(named: imgsList[indexPath.row] + ".jpeg")
        cell.sportName.text = imgsList[indexPath.row]
        cell.layer.cornerRadius = 20
        return cell
    }
    
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 185, height: 300)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        if let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as? SportsHeader{
            
            sectionHeader.header.text = "Sports"
            
            return sectionHeader
        }
        return UICollectionReusableView()
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let legues = storyboard?.instantiateViewController(withIdentifier: "leagues ") as! LeaguesTableView
        
        switch(imgsList[indexPath.row]){
        case "Football":
            legues.LeagueType = "Football"
        case "Basketball":
            legues.LeagueType = "Basketball"
        case "Cricket":
            legues.LeagueType = "Cricket"
        case "Tennis":
            legues.LeagueType = "Tennis"
        default:
            break
        }
        
        self.navigationController?.pushViewController(legues, animated: true)
    }

}
