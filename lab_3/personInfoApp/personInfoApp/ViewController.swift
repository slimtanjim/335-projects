//
//  ViewController.swift
//  Lab3
//
//  Created by Tanjim Haque on 2/14/22.
//


import UIKit

class ViewController: UIViewController {
    // ticket sales
    @IBOutlet weak var ageInput: UITextField!
    // genre
    @IBOutlet weak var nameInput: UITextField!
    // movie title
    @IBOutlet weak var ssnInput: UITextField!
    
    // create an infoDictionary object that stores the person info
    var personInfoDictionary:infoDictionary = infoDictionary()
    
    //text_field movie title
    @IBOutlet weak var searchTitle: UITextField!
    
    // text_field ticket sales
    @IBOutlet weak var searchedAge: UITextField!
    // text_field  genre
    @IBOutlet weak var searchedName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    // calling the search function
    @IBAction func search(_ sender: UIBarButtonItem) {
        
        // show the alert controller with data input text field
        let alertController = UIAlertController(title: "Search Record", message: "", preferredStyle: .alert)
        
        
        
        
        
        let serachAction = UIAlertAction(title: "Search", style: .default) { (aciton) in
            
            let text = alertController.textFields!.first!.text!
            
            
            if !text.isEmpty {
                let ssn = String(text)
                let p =  self.personInfoDictionary.search(s: ssn)
                if let x = p {
                    self.searchedName.text = x.name!
                    self.searchedAge.text = String(x.age!)
                    self.searchTitle.text = x.ssn!
                    print("In search")
                }
                else {
                    
                }
             }
             else {
                   // Alert message will be displayed to th user if there is no input
                   let alert = UIAlertController(title: "Data Input Error", message: "enter Movie Title to search", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    self.present(alert, animated: true)
                    
                }
                
            }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) {
            (action) in
        }
        
        alertController.addTextField {
            (textField) in
            textField.placeholder = "Enter Movie Title here"
            textField.keyboardType = .decimalPad
        }
        
        alertController.addAction(serachAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
        
        
    }
    
    
    // adding a new record
    @IBAction func addRec(_ sender: UIBarButtonItem) {
        // check if input fields are empty
        if let  ssn = ssnInput.text,
            let age = ageInput.text,
            let name = nameInput.text
            {
                //create a person record
                //let pRecord =  personRecord(n: name, s:ssn, a: age)
                //movie title | genre name | ticket sales
                
                personInfoDictionary.add(name, ssn, age)
                
                // remove data from the text fields
                self.ssnInput.text = ""
                self.ageInput.text = ""
                self.nameInput.text = ""
            }
        
        else{
               // Alert message will be displayed to th user if there is no input
               let alert = UIAlertController(title: "Data Input Error", message: "Data Inputs are either empty or incorrect types", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true)
            }
        }
    
    
// trash can left corner
    @IBAction func deleteRecord(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Delete", message: "Not Implemented", preferredStyle: .alert)
         
         alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
         self.present(alert, animated: true)
        
        
    }
    
    // edit button
    @IBAction func editRecord(_ sender: Any) {
        let alert = UIAlertController(title: "Edit", message: "Not Implemented", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
        
    }
    
//
//// previous button
//    @IBAction func prevRecord(_ sender: Any) {
//        let alert = UIAlertController(title: "Previous", message: "Not Implemented", preferredStyle: .alert)
//
//        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
//        self.present(alert, animated: true)
//    }
//
//
//// next
//    @IBAction func nextRecord(_ sender: Any) {
//        let alert = UIAlertController(title: "Next", message: "Not Implemented", preferredStyle: .alert)
//
//        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
//        self.present(alert, animated: true)
//    }
}
