//
//  DataBaseHelper.swift
//  hw_02
//
//  Created by Tanjim Haque on 4/23/22.
//
//
//import UIKit
//
//class DataBaseHelper {
//    static let shareInstance = DataBaseHelper()
//    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//    func saveImage(data: Data) {
//        let imageInstance = Image(context: context)
//        imageInstance.img = data
//        do {
//            try context.save()
//            print("Image is saved")
//        } catch {
//    print(error.localizedDescription)
//          }
//       }
//}
