//
//  DataPersistence.swift
//  UserPost
//
//  Created by Luis Santana on 25/9/22.
//

import Foundation


class DataPersistence<AnyObject: Codable>: NSObject{
    
    var delegate: FetchPersistenceData?
    
    func existData()-> Bool{
        
        guard let _ = UserDefaults.standard.object(forKey: Constants.key) else {
            return false
        }
        return true
    }
    
    
    func saveData(data: [AnyObject]) throws{
        
        do{
            let data = try JSONEncoder().encode(data)
            UserDefaults.standard.set(data, forKey: Constants.key)
            try? self.getData()
        }catch{
            print(error)
        }
        
    }
    
    func getData() throws {
        
        do{
            if let data = UserDefaults.standard.data(forKey: Constants.key){
                let finalData = try JSONDecoder().decode([AnyObject].self, from: data)
                self.delegate?.getPersistencedata(data: finalData)
            }
        }catch{
            print(error)
        }
        
    }
 
}
