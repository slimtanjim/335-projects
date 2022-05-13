//
//  ViewController.swift
//  hw_02
//
//  Created by Tanjim Haque on 4/22/22.
//

import UIKit
import CoreData

class ViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        if (selected_place != nil){
            box_title.text = selected_place?.title
            box_description.text = selected_place?.desc
            
            //addfing image
            loadimage.image = UIImage(data: selected_place!.image)
            //-- load it
        }
        
        // Do any additional setup after loading the view.
    }


    @IBOutlet weak var box_title: UITextField!

    @IBOutlet weak var box_description: UITextView!
    
    
    @IBOutlet weak var loadimage: UIImageView!
    
    
    //@IBOutlet weak var box_image:
    
    
    
    //segue prepare for segue 
    var selected_place: Place? = nil
    
    
    
    // save
    @IBAction func buttn_save(_ sender: Any) {
        ///
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        // context for saving entity
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        ///
        
        if(selected_place == nil){
            //entities
            let this_entity = NSEntityDescription.entity(forEntityName: "Place", in: context)
            
            let new_place = Place(entity: this_entity!, insertInto: context)
            
            new_place.id = place_list.count as NSNumber // new # each entry
            new_place.title = box_title.text
            new_place.desc = box_description.text
            
            //addign image data to core
            new_place.image = (self.loadimage.image?.pngData())!
            
            
            
    //        context.save()
            do {
                try context.save()
                place_list.append(new_place)
                
                //go back to place list
                navigationController?.popViewController(animated: true)
            }
            catch{
                print("context failed to save")
            }

        }//if
        else{
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Place")
            
            do{
                let result: NSArray = try context.fetch(request) as NSArray
                for result in result {
                    let place = result as! Place
                    //place_list.append(place)
                    if (place == selected_place){
                        place.title = box_title.text
                        place.desc = box_description.text
                        try context.save()
                        
                        //go back
                        navigationController?.popViewController(animated: true)
                        
                    }
                }
            }
            catch {
                print("failed loaing")
            }
        }
    }
    
    
    @IBAction func button_delete(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        // context for saving entity
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Place")
        
        do{
            let result: NSArray = try context.fetch(request) as NSArray
            for result in result {
                let place = result as! Place
                //place_list.append(place)
                if (place == selected_place){
                    place.deletedDate = Date() // deleteData
                    
                    //place.title = box_title.text
                    //place.desc = box_description.text
                    try context.save()
                    
                    //go back
                    navigationController?.popViewController(animated: true)
                }
            }
        }
        catch {
            print("failed loaing")
        }
    }
    
    //loadimage

    @IBAction func addimage(_ sender: Any) {
        let imagePickerVC = UIImagePickerController()
        imagePickerVC.sourceType = .photoLibrary
        imagePickerVC.delegate = self
        present(imagePickerVC, animated: true)
        
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            picker.dismiss(animated: true, completion: nil)
            if let image = info[.originalImage] as? UIImage {
                loadimage.image = image
            }
        }
}
