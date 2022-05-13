//
//  MoonViewController.swift
//  Lab2
//
//  Created by Tanjim Haque on 2/6/22.
//

import UIKit

class MoonViewController: UIViewController {
    
    var from_earth:Double?
    var moon_weight:Double?
    
    var finalData:String?
    
    var weight:Double?
    var moonWeights: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weight = Double(from_earth!)
        
        moonWeights = ((weight!) / 6)
        data = moonWeights
        
        
        earthWeight.text = String(weight!)
        moonWeight.text = String(moonWeights!)
        
        
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var earthWeight: UILabel!
    
    @IBOutlet weak var moonWeight: UILabel!
    
    @IBOutlet weak var lbl_welcome: UILabel!
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
