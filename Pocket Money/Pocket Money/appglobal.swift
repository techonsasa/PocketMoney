//
//  appglobal.swift
//  Pocket Money
//
//  Created by Sathiyan Kutty on 2/18/19.
//  Copyright © 2019 Ayeeshi Poosarla. All rights reserved.
//


//var tasks = ["Patience Stromberg", "Vonnie Heintzelman","Audria Yount","David Mcneely","Teisha Kanne","Jay Mccloy","Mark Russo","Carmelita Focht"]
//var amounts = ["$20","$30","$100","$50","$20","$30","$10","$40"]

struct App {
    var name: String
    var level: String
    var image:  String
}

struct TIBApps {
    static func getAllApps()-> [App] {
        return [
            App(name: "App1", level: "1", image: "1"),
            App(name: "App2", level: "2", image: "2")
        ]
    }
}

//struct txn {
//    var name: String
//    var level: String
//    var image:  String
//}
//
//struct TIBtxn {
//    static func getAlltxn()-> [txn] {
//        return [
//            txn(name: "Patience Stromberg", level: "1", image: "1"),
//            txn(name: "App2", level: "2", image: "2")
//        ]
//    }
//}
