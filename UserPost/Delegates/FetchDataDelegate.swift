//
//  FetchDataDelegate.swift
//  UserPost
//
//  Created by Luis Santana on 17/9/22.
//

import Foundation
import UIKit

protocol FetchDataDelegate{
    
    func getUsers(users: [UserModel]?, error: Error?)
    func getUserPost(userposts:[UserPost]?, error: Error?)
}



