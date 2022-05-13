//
//  ViewController.swift
//  Lab2
//
//  Created by Tanjim Haque on 2/6/22.
//

import UIKit

class ViewController: UIViewController {
    
    var var_moon:Double?
    var var_jupiter:Double?
    
    var var_earth:Double?
    
    var moonWeights:Double?

    override func viewDidLoad() {
        super.viewDidLoad()
//        // dosn't work :)
//        let image = UIImage(named: "earth.jpg")
//        self.img_earth.image = image
}
    
    
    
    
    
    @IBOutlet weak var lbl_earth: UILabel!
    @IBOutlet weak var tb_weight: UITextField!
    
    @IBOutlet weak var img_earth: UIImageView!
    
    @IBAction func btn_toMoon(_ sender: Any) {
        var_earth = Double(tb_weight.text!)
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let des = segue.destination as!
            MoonViewController
        if (segue.identifier == "toMoon")
        {
            des.from_earth = var_earth
        }
    }
    

    @IBAction func fromSecond(segue: UIStoryboardSegue)
    {
        if let sourceView = segue.source as? MoonViewController {
              var_moon = sourceView.moon_weight
        }
    }

}

