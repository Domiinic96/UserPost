//
//  ErrorView.swift
//  UserPost
//
//  Created by Luis Santana on 24/9/22.
//

import Foundation
import UIKit

class ErrorView: UIView{
    
    
    var message:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .green
        label.numberOfLines = 0
        return label
    }()
    
    
    private let errorImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: Constants.errorImage)
        return image
    }()
    
    func setUpView(controller: UIViewController){
        self.translatesAutoresizingMaskIntoConstraints = false
        controller.view.addSubview(self)
        self.heightAnchor.constraint(equalTo: controller.view.heightAnchor).isActive = true
        self.widthAnchor.constraint(equalTo: controller.view.widthAnchor).isActive = true
        
        self.addSubview(errorImage)
        errorImage.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        errorImage.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        errorImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constants.anchorForErrorView).isActive = true
        errorImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Constants.anchorForErrorView).isActive = true

        errorImage.heightAnchor.constraint(equalToConstant: Constants.anchorForErrorView2).isActive = true
        errorImage.widthAnchor.constraint(equalToConstant: Constants.anchorForErrorView2).isActive = true

        self.addSubview(message)
        message.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        message.bottomAnchor.constraint(equalTo: errorImage.topAnchor, constant: -Constants.anchorForErrorView).isActive = true
        
    }
    
    func removeViewFromSuperView(){
        self.removeFromSuperview()
    }

}
