//
//  WebService.swift
//  UserPost
//
//  Created by Luis Santana on 17/9/22.
//

import Foundation
class WebService: FetchPersistenceData{
    
    func getPersistencedata(data: [Any]) {
        if let finalData = data as? [UserModel]{
            self.delegate?.getUsers(users: finalData, error: nil)
        }
    }
    
    var delegate: FetchDataDelegate?
    private var dataPersistence = DataPersistence<UserModel>()
    
    init() {
        self.dataPersistence.delegate = self
    }
    
    func getUsers(){
        
        if self.dataPersistence.existData() {
            try? self.dataPersistence.getData()
        }else{
            ApiClient<UserModel>.fetchListData(url: Constants.usersUrl) { users, error in
                if let users = users{
                    try? self.dataPersistence.saveData(data: users)
                }else{
                    self.delegate?.getUsers(users: users, error: error)
                }
            }
        }
    }
    
    
    func getPost(userId: Int){
        ApiClient<UserPost>.fetchListData(url: Constants.urlPostFilter + "\(userId)") { posts, error in
            
                self.delegate?.getUserPost(userposts: posts, error: error)

        }
    }
}
