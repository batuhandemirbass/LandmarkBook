//
//  ViewController.swift
//  LanmarkBooks
//
//  Created by Batuhan Demirbaş on 6.01.2022.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    var landmarkNames = [String]()
    var landmarkImages = [UIImage]()
    var chosenLandmarkNames = ""
    var chosenLandmarkImages = UIImage()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        
        //Landmark Book Data
        landmarkNames.append("collesum")
        landmarkNames.append("cremlin")
        landmarkNames.append("greatwall")
        landmarkNames.append("stonehange")
        landmarkNames.append("tacmahal")

        //Landmark Image Data
        landmarkImages.append(UIImage(named: "collesum")!)
        landmarkImages.append(UIImage(named: "cremlin")!)
        landmarkImages.append(UIImage(named: "greatwall")!)
        landmarkImages.append(UIImage(named: "stonehange")!)
        landmarkImages.append(UIImage(named: "tacmahal")!)
        
        navigationItem.title = "LandmarkBook"
        
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            landmarkNames.remove(at: indexPath.row)
            landmarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text=landmarkNames[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         chosenLandmarkNames = landmarkNames[indexPath.row]
         chosenLandmarkImages = landmarkImages[indexPath.row]
        performSegue(withIdentifier: "toImageViewController", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toImageViewController"{
            let destinationVC = segue.destination as! imageViewController
            destinationVC.selectedLandmarkNames = chosenLandmarkNames
            destinationVC.selectedLandmarkImages = chosenLandmarkImages
        }
    }
}
