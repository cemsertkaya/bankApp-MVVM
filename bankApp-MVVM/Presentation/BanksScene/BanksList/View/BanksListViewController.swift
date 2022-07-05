//
//  BankListViewController.swift
//  bankApp-MVVM
//
//  Created by Cem Sertkaya on 3.07.2022.
//

import UIKit


final class BanksListViewController: UIViewController, StoryboardInstantiable
{
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    private var viewModel : BanksListViewModel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setUpTableView()
        viewModel.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    static func create(with viewModel: BanksListViewModel) -> BanksListViewController
    {
        let view = BanksListViewController.instantiateViewController()
        view.viewModel = viewModel
        return view
    }
    
    private func bind(to viewModel: BanksListViewModel)
    {
        viewModel.items.observe(on: self) { [weak self] _ in self?.updateItems() }
        //viewModel.loading.observe(on: self) { [weak self] in self?.updateLoading($0) }
        //viewModel.query.observe(on: self) { [weak self] in self?.updateSearchQuery($0) }
        //viewModel.error.observe(on: self) { [weak self] in self?.showError($0) }
    }

    

}

extension BanksListViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{return 50}
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell",for: indexPath) as? TableViewCell
        else
        {
            assertionFailure("Cannot dequeue reusable cell \(TableViewCell.self) with reuseIdentifier: tableViewCell")
            return UITableViewCell()
        }
        
        //cell.configure(with: viewModel.items.value[indexPath.row], posterImagesRepository: posterImagesRepository)
        
        return cell
    }
    
    func setUpTableView()
    {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {viewModel.didSelectItem(at: indexPath.row)}
    
    private func updateItems() {
        print("em")
        self.tableView.reloadData()}
}
