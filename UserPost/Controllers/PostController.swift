//
//  ViewController.swift
//  UserPost
//
//  Created by Luis Santana on 17/9/22.
//

import UIKit

class PostController: UIViewController {
    
    var webservice = WebService()
    var userInfo: UserModel
    var posts: [UserPost] = [UserPost]()
    let tableView = UITableView()
    
    init(userInfo: UserModel) {
        self.userInfo = userInfo
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.webservice.delegate = self
        self.webservice.getPost(userId: userInfo.id)
    }
    
    private func setUpView(){
        self.view.addSubview(tableView)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        tableView.frame = self.view.bounds
        tableView.separatorStyle = .none
        self.tableView.register(PostCell.self, forCellReuseIdentifier: Constants.postCell)
        self.view.backgroundColor = .white
        
    }
}


// MARK: - FetchDataDelegate

extension PostController: FetchDataDelegate{
    func getUsers(users: [UserModel]?, error: Error?) {
        
    }
    
    func getUserPost(userposts: [UserPost]?, error: Error?) {
        
        print("Delegate Method called")
        if let userposts = userposts{
            print("post response success")
            print("total posts = \(userposts.count)")
            self.posts = userposts
            self.setUpView()
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

// MARK: - TableViewDelegate Methods

extension PostController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.postCell) as! PostCell
        cell.setUpInfo(post: posts[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.userPostTableCellHeight
    }
}

