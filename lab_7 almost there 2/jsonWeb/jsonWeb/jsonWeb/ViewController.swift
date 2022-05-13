//
//  ViewController.swift
//  jsonWeb
//tanjim haque :)
//  Created by user on 10/24/15.
//  Copyright (c) 2015 ASU. All rights reserved.
//
import UIKit
import MapKit

class ViewController: UIViewController {



    
    @IBOutlet weak var box_address: UITextField!

    
    @IBOutlet weak var box_longitude: UITextField!
    
    @IBOutlet weak var box_latitude: UITextField!
    
    
    @IBOutlet weak var box_eq_data: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
           }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    @IBAction func callAsync_10data(_ sender: AnyObject) {
//
//        DispatchQueue.main.async(execute: {
//            self.getJsonData()
//        })
//    }
    
    
    @IBAction func callAsyncNow(_ sender: Any) {
        DispatchQueue.main.async(execute: {
            self.getJsonData()
        })
    }
    
    
    
    
    

    
    func getJsonData() {
        
        let box_longitude = box_longitude.text!
        let box_latitude = box_latitude.text!
        
        var quake_date = [String]()
        var magnitude = [Double] ()
        
        // coordinates
        let north = Double(box_longitude)! + 10
        let str_north = String(north)
        
        let south = Double(box_longitude)! - 10
        let str_south = String(south)

        let east = Double(box_latitude)! + 10
        let str_east = String(east)

        let west = Double(box_latitude)! - 10
        let str_west = String(west)
        
        
//        /* make sure to add the user name to change your user name once you have registered in
//           http://api.geonames.org/login
//        */
//
//
//        let urlAsString = "http://api.geonames.org/postalCodeLookupJSON?postalcode="+zipcode!+"&country="+country!+"&username=USERNAME"
        
//stanman
        let urlAsString
            = "http://api.geonames.org/earthquakesJSON?north=" +
                str_north+"&south=" +
                str_south+"&east=" +
                str_east+"&west=" +
                str_west + "&username=stanman"
        

//
//        let urlAsString = "http://api.geonames.org/postalCodeLookupJSON?postalcode="+zipcode!+"&country="+country!+"&username=stanman"
        
        
        
        let url = URL(string: urlAsString)!
        let urlSession = URLSession.shared
        
        
        let jsonQuery = urlSession.dataTask(with: url, completionHandler: { data, response, error -> Void in
            if (error != nil) {
                print(error!.localizedDescription)
            }
            var err: NSError?
            
            
            let jsonResult = (try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)) as! NSDictionary
            if (err != nil) {
                print("jason's date ")
                print("JSON Error \(err!.localizedDescription)")
            }
            print(jsonResult)
          
//           let setOne:NSArray = jsonResult["postalcodes"] as! NSArray
//            print(setOne);
            let setOne:NSArray = jsonResult["earthquales"] as! NSArray
            print(setOne)
            
            ///////<<<<<<<<  only 10 itme s
            ///

            
            
   
            
            
            
         ///
            ///
            ///
            
       
            
            
            
//            let y = setOne[0] as? [String: AnyObject]
//            print(y?["placeName"])
//
//
//            let ln: Double = (y!["lng"] as? NSNumber)!.doubleValue
//            let lt: Double = (y!["lat"] as? NSNumber)!.doubleValue
//
//             print(ln)
//             print(lt)
            
          
        )
        jsonQuery.resume()
    }
    
    
    
    
    
    /*

    @IBAction func get_coordinates(_ sender: Any) {
//        let zipcode = zipCode.text
//        let country = self.country.text
//
        /*  make sure to add the user name to change your user name once you have registered in
           http://api.geonames.org/login
        */
           
//
//           let urlAsString = "http://api.geonames.org/postalCodeLookupJSON?postalcode="+zipcode!+"&country="+country!+"&username=jbasu"
        
        let url = URL(string: urlAsString)!
        let urlSession = URLSession.shared
        

        let jsonQuery = urlSession.dataTask(with: url, completionHandler: { data, response, error -> Void in
            if (error != nil) {
                print(error!.localizedDescription)
            }
            var err: NSError?
            
            
            var jsonResult = (try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)) as! NSDictionary
            if (err != nil) {
                print("JSON Error \(err!.localizedDescription)")
            }
            
            print(jsonResult)
           
            
            let setOne = jsonResult["postalcodes"]! as! NSArray
            
            print(setOne)
            print(setOne + " check")
            
            
            
//          let y = setOne[0] as? [String: AnyObject]
//
//            print(y!["lng"]!)
//            print(y!["lat"]!)
//
//            let ln: Double = (y!["lng"] as? NSNumber)!.doubleValue
//            let lt: Double = (y!["lat"] as? NSNumber)!.doubleValue
//
////            self.lonval = ln
////            self.latval = lt;
        
            
        
            
            
            
            
            
        DispatchQueue.main.async{
            self.box_longitude.text = String(ln)
            self.box_latitude.text  = String(lt)
        }
            
        print(y?["placeName"])
           
        })
        
        jsonQuery.resume()
        
    }
     */

    
    @IBAction func find_city(_ sender: Any) {
        
        
        //let geoCoder = CLGeocoder();
        _ = CLGeocoder();
        let addressString = box_address.text!
        CLGeocoder().geocodeAddressString(addressString,
            completionHandler:
            {(placemarks, error) in
                                                            
            if error != nil {
            print("Geocode failed: \(error!.localizedDescription)")
            }
            
            else if placemarks!.count > 0 {
            let placemark = placemarks![0]
            let location = placemark.location
            //let coords = location!.coordinate
            print(location as Any)
                                                               
            let span = MKCoordinateSpan.init(latitudeDelta:0.05, longitudeDelta: 0.05)
            print("span: ", span)
                
            let region = MKCoordinateRegion(center: placemark.location!.coordinate, span: span)
            print("region: ",region)
            
            let ani = MKPointAnnotation()
            ani.coordinate = placemark.location!.coordinate
            ani.title = placemark.locality
            ani.subtitle = placemark.subLocality
                
            print ("ani: ", ani.coordinate)
                
            print (ani.coordinate.latitude)
                
                self.box_address.text = ""
                self.box_longitude.text = String(ani.coordinate.latitude)
                
                self.box_latitude.text =        String(ani.coordinate.longitude)
            

            }
            })
    }
    
    @IBAction func get_address(_ sender: Any) {
        
//
//
//        //let geoCoder = CLGeocoder();
//        _ = CLGeocoder();
//        let addressString = box_address.text!
//        CLGeocoder().geocodeAddressString(addressString,
//            completionHandler:
//            {(placemarks, error) in
//
//            if error != nil {
//            print("Geocode failed: \(error!.localizedDescription)")
//            }
//
//            else if placemarks!.count > 0 {
//            let placemark = placemarks![0]
//            let location = placemark.location
//            //let coords = location!.coordinate
//            print(location as Any)
//
//            let span = MKCoordinateSpan.init(latitudeDelta:0.05, longitudeDelta: 0.05)
//            print("span: ", span)
//
//            let region = MKCoordinateRegion(center: placemark.location!.coordinate, span: span)
//            print("region: ",region)
//
//            let ani = MKPointAnnotation()
//            ani.coordinate = placemark.location!.coordinate
//            ani.title = placemark.locality
//            ani.subtitle = placemark.subLocality
//
//            print ("ani: ", ani.coordinate)
//
//            print (ani.coordinate.latitude)
//
//                self.box_address.text = ""
//                self.box_longitude.text = String(ani.coordinate.latitude)
//
//                self.box_latitude.text =        String(ani.coordinate.longitude)
//
//
//            }
//            })
    }
    
}

