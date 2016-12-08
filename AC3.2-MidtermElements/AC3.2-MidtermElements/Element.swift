
//
//  Element.swift
//  AC3.2-MidtermElements
//
//  Created by C4Q on 12/8/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import Foundation

class Element {
    
    let number: Int
    let weight: Double
    let name: String
    let symbol: String
    let melting: Int?
    let boiling: Int?
    let crustPercent: Double?
    let density: Double?
    let yearDiscovered: String
    let group: Int
    let electrons: String?
    let ionEnergy: Double?
    
    init (number: Int, weight: Double, name: String, symbol: String, melting: Int?, boiling: Int?, crustPercent: Double?, density: Double?, yearDiscovered: String, group: Int, electrons: String?, ionEnergy: Double?) {
        self.number = number
        self.weight = weight
        self.name = name
        self.symbol = symbol
        self.melting = melting
        self.boiling = boiling
        self.crustPercent = crustPercent
        self.density = density
        self.yearDiscovered = yearDiscovered
        self.group = group
        self.electrons = electrons
        self.ionEnergy = ionEnergy
    }
    
    private static func handleNull(_ element: Any?) -> Any? {
        if element is NSNull {
            return nil
        } else {
            return element
        }
    }
    
    convenience init? (elementDict: [String:Any]) {
        var crustPercent: Double?
        var boiling: Int?
        var density: Double?
        var melting: Int?
        var ionEnergy: Double?
        var electrons: String?
        
        guard let number = elementDict["number"] as? Int else {
            print("number")
            return nil
        }

        guard let weight = elementDict["weight"] as? Double else {
            print("weight")
            return nil
        }

        guard    let name = elementDict["name"] as? String else {
            print("name")
            return nil
        }

        guard  let symbol = elementDict["symbol"] as? String else {
            print("sybmol")
            return nil
        }

        if let _ = elementDict["melting_c"] as? NSNull {
            melting = nil
        } else {
            melting = elementDict["melting_c"] as? Int
        }
       
        if let _ = elementDict["boiling_c"] as? NSNull {
            boiling = nil
        } else {
            boiling = elementDict["boiling_c"] as? Int
        }
        
        if let _ = elementDict["crust_percent"] as? NSNull {
            crustPercent = nil
        } else {
            crustPercent = elementDict["crust_percent"] as? Double
        }

        if let _ = elementDict["density"] as? NSNull {
            print("Null value handled")
            density = nil
        } else {
            density = elementDict["density"] as? Double
        }

        guard   let yearDiscovered = elementDict["discovery_year"] as? String else {
            print("year")
            return nil
        }

        guard let group = elementDict["group"] as? Int else {
            print("group")
            return nil
        }
        
        if let _ = elementDict["electrons"] as? NSNull {
            print("Null value handled")
            electrons = nil
        } else {
            electrons = elementDict["density"] as? String
        }
        
        if let _ = elementDict["ion_energy"] as? NSNull {
            print("Null value handled")
            ionEnergy = nil
        } else {
            ionEnergy = elementDict["density"] as? Double
        }
        
        
        self.init(number: number, weight: weight, name: name, symbol: symbol, melting: melting, boiling: boiling, crustPercent: crustPercent, density: density, yearDiscovered: yearDiscovered, group: group, electrons: electrons, ionEnergy: ionEnergy)
    }
    
}
