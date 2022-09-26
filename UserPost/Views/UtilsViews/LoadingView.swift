//
//  LoadingView.swift
//  UserPost
//
//  Created by Luis Santana on 18/9/22.
//

import Foundation
import UIKit


class LoadingView: UIView{
    
    
    let loadingView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black.withAlphaComponent(0.5)
        view.layer.cornerRadius = 5
        return view
    }()
    
    let loadingLabelView: UILabel = {
        let label = UILabel()
        label.text = Constants.loadingMessage
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let loadingIndicator: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView()
        activity.color = .green
        activity.startAnimating()
        activity.translatesAutoresizingMaskIntoConstraints = false
        return activity
    }()
    
    func setUpView(controller: UIViewController){
        
        controller.view.addSubview(loadingView)
        self.loadingView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        self.loadingView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        loadingView.centerXAnchor.constraint(equalTo: controller.view.centerXAnchor).isActive = true
        loadingView.centerYAnchor.constraint(equalTo: controller.view.centerYAnchor).isActive = true
        self.loadingView.addSubview(loadingLabelView)
        self.loadingLabelView.centerXAnchor.constraint(equalTo: self.loadingView.centerXAnchor, constant: 0).isActive = true
        self.loadingLabelView.centerYAnchor.constraint(equalTo: self.loadingView.centerYAnchor, constant: 0).isActive = true
   
        self.loadingLabelView.addSubview(loadingIndicator)
        self.loadingIndicator.centerXAnchor.constraint(equalTo: self.loadingLabelView.centerXAnchor, constant: 0).isActive = true
        self.loadingIndicator.centerYAnchor.constraint(equalTo: self.loadingLabelView.centerYAnchor, constant: -20).isActive = true
        self.loadingIndicator.widthAnchor.constraint(equalToConstant: 75).isActive = true
        self.loadingIndicator.heightAnchor.constraint(equalToConstant: 75).isActive = true
            
    }
    
}

