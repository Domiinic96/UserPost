//
//  PostCell.swift
//  UserPost
//
//  Created by Luis Santana on 18/9/22.
//

import UIKit

class PostCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpCell()
        contentView.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    var postTitle: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .justified
        label.textColor = .black
        return label
    }()
    
    var postInfo: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .justified
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    
    var infoView: UIView = {
      let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 5
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        return view
    }()
    
    
    
    func setUpCell(){
        
        contentView.addSubview(infoView)
        infoView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        infoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        infoView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        infoView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        
        infoView.addSubview(postTitle)
        postTitle.centerXAnchor.constraint(equalTo: infoView.centerXAnchor).isActive = true
        postTitle.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 15).isActive = true
        postTitle.trailingAnchor.constraint(equalTo: infoView.trailingAnchor, constant: -15).isActive = true
        postTitle.topAnchor.constraint(equalTo: infoView.topAnchor, constant: 5).isActive = true

        
        infoView.addSubview(postInfo)
        postInfo.leadingAnchor.constraint(equalTo: infoView.leadingAnchor, constant: 15).isActive = true
        postInfo.trailingAnchor.constraint(equalTo: infoView.trailingAnchor, constant: -15).isActive = true
        postInfo.topAnchor.constraint(equalTo: postTitle.bottomAnchor, constant: 10).isActive = true

    }
    
    func setUpInfo(post: UserPost){
        self.postTitle.text = post.title
        self.postInfo.text = post.body
    }
    
}
