//
//  BankDetailsViewController.swift
//  bankApp-MVVM
//
//  Created by Cem Sertkaya on 3.07.2022.
//

import UIKit

class BankDetailsViewController: UIViewController, StoryboardInstantiable  {
    
    private var viewModel: BankDetailsViewModel!
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setUpTableView()
        
    }

    static func create(with viewModel: BankDetailsViewModel) -> BankDetailsViewController
    {
        let view = BankDetailsViewController.instantiateViewController()
        view.viewModel = viewModel
        return view
    }
  
    @IBAction func goWithNavigationButton(_ sender: Any) {viewModel.pushToMap(in: self, sourceView: sender as! UIView)}
}

extension BankDetailsViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{return 10}
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell()
        cell.textLabel?.text = viewModel.getContent(index: indexPath.row)
        
        if indexPath.row == 9 || indexPath.row == 8 {cell.textLabel?.font =  UIFont.systemFont(ofSize: 10)}
        return cell
    }
    
    func setUpTableView()
    {
        tableView.delegate = self
        tableView.dataSource = self
    }
}
