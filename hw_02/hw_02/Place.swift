//
//  Place.swift
//  hw_02
//
//  Created by Tanjim Haque on 4/23/22.
//

import CoreData

@objc(Place)
class Place: NSManagedObject{
    @NSManaged var id: NSNumber!
    @NSManaged var title: String!
    //@NSManaged override var description: String
    @NSManaged var desc: String!
    @NSManaged var deletedDate: Date?
    @NSManaged var image: Data
}
