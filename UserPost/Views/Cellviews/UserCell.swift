//
//  UserCell.swift
//  UserPost
//
//  Created by Luis Santana on 17/9/22.
//

import Foundation
import UIKit

class UserCell: UITableViewCell{
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpCell()
        self.backgroundColor = .white
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    var bottonLineView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var infoView: UIView = {
      let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var userPostLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Constants.appColor
        label.text = Constants.watchPosts
        return label
    }()
    
    var phoneImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        let imag = UIImage(systemName: Constants.phoneImageName)
        image.tintColor = Constants.appColor!
        image.image = imag
        return image
    }()
    
    var letterImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        let imag = UIImage(systemName: Constants.letterImageName)
        image.tintColor = Constants.appColor!
        image.image = imag
        
        return image
    }()
    
    var userNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = Constants.appColor
        return label
    }()
    
    
    var userPhoneLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()
    
    var userEmailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()
    
    private func setUpCell(){
        
        contentView.addSubview(infoView)
  
        infoView.topAnchor.constraint(equalTo:contentView.topAnchor , constant: 30).isActive = true
        infoView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30).isActive = true
        infoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30).isActive = true
        infoView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30).isActive = true
        
        infoView.addSubview(userNameLabel)
        userNameLabel.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 5).isActive = true
        userNameLabel.topAnchor.constraint(equalTo: infoView.topAnchor, constant: 15).isActive = true
        
        infoView.addSubview(phoneImage)
        phoneImage.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 5).isActive = true
        phoneImage.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 5).isActive = true
        
        infoView.addSubview(userPhoneLabel)
        userPhoneLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 5).isActive = true
        userPhoneLabel.leadingAnchor.constraint(equalTo: phoneImage.trailingAnchor, constant: 5).isActive = true
        
        infoView.addSubview(letterImage)
        letterImage.topAnchor.constraint(equalTo: phoneImage.bottomAnchor, constant: 5).isActive = true
        letterImage.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 5).isActive = true
        infoView.addSubview(userEmailLabel)
        userEmailLabel.topAnchor.constraint(equalTo: userPhoneLabel.bottomAnchor, constant: 5).isActive = true
        userEmailLabel.leadingAnchor.constraint(equalTo: letterImage.trailingAnchor, constant: 5).isActive = true
        
        infoView.addSubview(userPostLabel)
        userPostLabel.trailingAnchor.constraint(equalTo: infoView.trailingAnchor, constant: -15).isActive = true
        userPostLabel.bottomAnchor.constraint(equalTo: infoView.bottomAnchor, constant: -30).isActive = true
        
        bottonLineView.backgroundColor = .black
        infoView.addSubview(bottonLineView)
        bottonLineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        bottonLineView.widthAnchor.constraint(equalTo: infoView.widthAnchor).isActive = true
        
        bottonLineView.bottomAnchor.constraint(equalTo: infoView.bottomAnchor, constant: -2).isActive = true
        
    }
    
    func setUserInfo(userInfo: UserModel){
        userNameLabel.text = userInfo.name
        userPhoneLabel.text = userInfo.phone
        userEmailLabel.text = userInfo.email
    }
}
