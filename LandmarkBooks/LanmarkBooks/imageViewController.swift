//
//  imageViewController.swift
//  LanmarkBooks
//
//  Created by Batuhan Demirbaş on 7.01.2022.
//

import UIKit

class imageViewController: UIViewController {

    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var landmarkLable: UILabel!
     var selectedLandmarkNames = ""
    var selectedLandmarkImages = UIImage()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        landmarkLable.text = selectedLandmarkNames
        ImageView.image = selectedLandmarkImages
    }

}
