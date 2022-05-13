//
//  Place_Cell.swift
//  hw_02
//
//  Created by Tanjim Haque on 4/22/22.
//

import UIKit

class Place_Cell: UITableViewCell{
    
    @IBOutlet weak var label_title: UILabel!
    
    @IBOutlet weak var label_description: UILabel!
    
    
    @IBOutlet weak var smallimage: UIImageView!{
        didSet{
            smallimage.layer.cornerRadius = smallimage.bounds.width / 2
            smallimage .clipsToBounds = true
        }
    }
}
