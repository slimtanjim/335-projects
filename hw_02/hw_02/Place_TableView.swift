//
//  Place_TableView.swift
//  hw_02
//
//  Created by Tanjim Haque on 4/22/22.
//

import UIKit
import CoreData

// pull in vew controller 
var place_list = [Place]()

class Place_TableView: UITableViewController{
    
    // save to core data
    var load_start = true
    
    //deleting
    func delete_flag() -> [Place]{
        var saved_places = [Place]()
        
        for places in place_list {
            if(places.deletedDate == nil){
                saved_places.append(places)
            }
        }
        return saved_places
    }
    
    
    
    
    override func viewDidLoad() {
        if (load_start == true){
            load_start = false
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            // context for saving entity
            let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
            
            
            // resue recycle 
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Place")
            
            do{
                let result: NSArray = try context.fetch(request) as NSArray
                for result in result {
                    let place = result as! Place
                    place_list.append(place)
                }
            
            }
            catch {
                print("failed loaing")
            }
        
        
        }
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let place_cell = tableView.dequeueReusableCell(withIdentifier: "place_cell_id", for: indexPath) as! Place_Cell
        // itentidieer in the table view cell
        
        let this_place: Place! // new place
        //this_place = place_list[indexPath.row]
        this_place = delete_flag()[indexPath.row]
        
        // update with obj data
        place_cell.label_title.text = this_place.title
        place_cell.label_description.text = this_place.desc
        place_cell.smallimage.image = UIImage(data: this_place!.image)
       
//        print("title is: ", place_cell.label_title.text as Any)
//        print(place_cell.label_description.text as Any)
        
        
        
        
        
        return place_cell
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        //return place_list.count 11
        return delete_flag().count
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        //refresh
        tableView.reloadData()
    }
    
    
    //editing
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "editplace", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "editplace"){
            let index_path = tableView.indexPathForSelectedRow!
            let place_detail = segue.destination as? ViewController
            
            let selectedplace : Place!
            //selectedplace = place_list[index_path.row] 11
            selectedplace = delete_flag()[index_path.row]
            place_detail!.selected_place = selectedplace
            
            //after pasign
            
            //tableView(, numberOfRowsInSection: <#T##Int#>)
            tableView.deselectRow(at: index_path, animated: true)
            
        }
    }
    
}
