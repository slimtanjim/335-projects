//
//  ViewController.swift
//  Lab3
//
//  Created by Tanjim Haque on 2/14/22.
//

import Foundation
class personRecord{
    //genre
    var name:String? = nil
    //movie title
    var ssn:String? = nil
    // ticket sales
    var age:String? = nil
    
    init(n:String, s:String, a:String) {
        self.name = n
        self.ssn = s
        self.age = a
    }
    
    func change_age(newAge:String){
        self.age = newAge;
    }
    
}
