//
//  ViewController.swift
//  Lab3
//
//  Created by Tanjim Haque on 2/14/22.
//


import Foundation
class infoDictionary
{
    // dictionary that stores person records
    var infoRepository : [String:personRecord] = [String:personRecord] ()
    init() { }
  
    func add(_ name:String, _ ssn:String, _ age:String)
    {
        let pRecord =  personRecord(n: name, s:ssn, a: age)
        infoRepository[pRecord.ssn!] = pRecord
        
    }
    
    func add(p:personRecord)
    {
        print("adding" + p.name!)
        infoRepository[p.ssn!] = p
        
    }
    
    func search(s:String) -> personRecord?
    {
        var found = false
        
        for (ssn, _) in infoRepository
        {
            if ssn == s {
            found = true
                break
            }
        }
        if found
        {
           return infoRepository[s]
        }else  {
     
            return nil
            }
    }
    
    func deleteRec(s:String)
    {
        infoRepository[s] = nil
        
    }
}
