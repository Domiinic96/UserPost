//
//  MainController.swift
//  UserPost
//
//  Created by Luis Santana on 17/9/22.
//

import Foundation
import UIKit

class MainController: UISearchController{
    
    var webservice = WebService()
    var users: [UserModel] = [UserModel]()
    var user2: [UserModel] = [UserModel]()
    let activityIndicator = LoadingView()
    let errorView = ErrorView()
    let tableView = UITableView()
    let searchBarTextField = UISearchBar()
    let headerTableView = UIView()
    let headerTableViewLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = Constants.navigationBarTittle
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = Constants.appColor
        self.navigationController?.navigationBar.standardAppearance = appearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = self.navigationController?.navigationBar.standardAppearance
        self.view.backgroundColor = .white
        self.webservice.delegate = self
        self.webservice.getUsers()
    }
    
    private func setUpView(){
        
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.register(UserCell.self, forCellReuseIdentifier: Constants.userInfoCell)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.sectionHeaderHeight = 200
        self.view.addSubview(tableView)
        tableView.frame = self.view.bounds
        
    }
    
    private func startActivityIndicator(){
        
        DispatchQueue.main.async {
            self.activityIndicator.setUpView(controller: self)
            self.activityIndicator.loadingIndicator.startAnimating()
        }
    }
    
    private func stopActivityIndicator(){
        self.activityIndicator.loadingIndicator.stopAnimating()
        self.activityIndicator.loadingView.removeFromSuperview()
        self.activityIndicator.removeFromSuperview()
    }
}
    
// MARK: - TableViewDelegate Methods
    
    extension MainController: UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate{
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: Constants.userInfoCell) as! UserCell
         cell.setUserInfo(userInfo: users[indexPath.row])
         cell.userNameLabel.text = cell.userNameLabel.text! + " \(indexPath.row)"
         return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

         return user2.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        tableView.separatorStyle = .none
        let userInfo = users[indexPath.row]
        let postController = PostController(userInfo: userInfo)
        self.navigationController?.pushViewController(postController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        self.headerTableView.backgroundColor = .white
        self.headerTableViewLabel.translatesAutoresizingMaskIntoConstraints = false
        self.headerTableViewLabel.text = Constants.searchUser
        self.headerTableViewLabel.textColor = Constants.appColor
     
        self.headerTableView.addSubview(headerTableViewLabel)
        self.headerTableViewLabel.topAnchor.constraint(equalTo: headerTableView.topAnchor, constant: 10).isActive = true
        self.headerTableViewLabel.leadingAnchor.constraint(equalTo: headerTableView.leadingAnchor, constant: 20).isActive = true
        
        self.searchBarTextField.translatesAutoresizingMaskIntoConstraints = false
        self.searchBarTextField.barTintColor = .clear
        self.searchBarTextField.layer.cornerRadius = 5
        self.searchBarTextField.delegate = self
        self.searchBarTextField.placeholder = Constants.searchUser
        self.searchBarTextField.showsCancelButton = true
        
        headerTableView.addSubview(self.searchBarTextField)
        self.searchBarTextField.leadingAnchor.constraint(equalTo: headerTableView.leadingAnchor, constant: 20).isActive = true
        self.searchBarTextField.trailingAnchor.constraint(equalTo: headerTableView.trailingAnchor, constant: -20).isActive = true
        self.searchBarTextField.topAnchor.constraint(equalTo: headerTableView.topAnchor, constant: 30).isActive = true
        self.searchBarTextField.bottomAnchor.constraint(equalTo: headerTableView.bottomAnchor, constant: -30).isActive = true
        self.searchBarTextField.searchBarStyle = .default
        headerTableView.backgroundColor = .white
        return headerTableView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
        
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        user2 = searchText == "" ? users : users.filter{$0.name.localizedCaseInsensitiveContains(searchText)}
        tableView.reloadData()
    }
   
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        self.searchBar.resignFirstResponder()
        self.searchBar.endEditing(true)
        return true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.searchBarTextField.endEditing(true)
    }
    
}
//MARK: - FetchDataDelegate
extension MainController: FetchDataDelegate{

    func getUsers(users: [UserModel]?, error: Error?) {
        if let users = users{
            self.startActivityIndicator()
            self.users = users
            self.user2 = self.users
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                print(users.count)
                if self.view.subviews.contains(where: { $0 is ErrorView}){
                    self.errorView.removeFromSuperview()
                }
               
                self.setUpView()
                self.tableView.reloadData()
                self.stopActivityIndicator()
            })
        }
        
        if let error = error{
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                
                self.stopActivityIndicator()
                self.errorView.setUpView(controller: self)
                self.errorView.message.text = error.localizedDescription
                
                let btn1 = UIButton(type: .custom)
                btn1.setImage(UIImage(systemName: Constants.reloadIcon), for: .normal)
                btn1.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
                btn1.addTarget(self, action: #selector(self.reloadData), for: .touchUpInside)
                let item1 = UIBarButtonItem(customView: btn1)
                self.navigationItem.setRightBarButtonItems([item1], animated: true)
            })
        }
    }
    
    @objc private func reloadData(){
        self.startActivityIndicator()
        self.errorView.removeFromSuperview()
        self.webservice.getUsers()
    }
    
    func getUserPost(userposts: [UserPost]?, error: Error?) {
        
    }
}


