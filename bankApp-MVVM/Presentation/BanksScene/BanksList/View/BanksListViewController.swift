//
//  BankListViewController.swift
//  bankApp-MVVM
//
//  Created by Cem Sertkaya on 3.07.2022.
//

import UIKit


final class BanksListViewController: UIViewController, StoryboardInstantiable, Alertable
{
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    private var viewModel : BanksListViewModel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupViews()
        setUpTableView()
        setUpSearchBar()
        viewModel.viewDidLoad()
        bind(to: viewModel)
        
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
        viewModel.loading.observe(on: self) { [weak self] in self?.updateLoading($0)}
        viewModel.error.observe(on: self) { [weak self] in self?.showError($0)}
    }

    private func setupViews()
    {
        title = viewModel.screenTitle
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    private func updateItems() {self.tableView.reloadData()}

    private func updateLoading(_ loading: BanksListViewModelLoading?) {
        
        CustomLoadingView.hide()

        switch loading
        {
            case .fullScreen: CustomLoadingView.show()
            case .nextPage: CustomLoadingView.hide()
            case .none: CustomLoadingView.hide()
        }
    }
    
    private func showError(_ error: String) {
        guard !error.isEmpty else { return }
        showAlert(title: viewModel.errorTitle, message: error)
    }
    
    @IBAction func refreshButtonAction(_ sender: Any) {viewModel.refreshBanks()}
    
    @objc func dismissKeyboard() {view.endEditing(true)}
}

extension BanksListViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{return viewModel.items.value.count}
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell",for: indexPath) as? TableViewCell
        else
        {
            assertionFailure("Cannot dequeue reusable cell \(TableViewCell.self) with reuseIdentifier: tableViewCell")
            return UITableViewCell()
        }
        
        cell.fill(with: viewModel.items.value[indexPath.row])
        
        return cell
    }
    
    func setUpTableView()
    {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {viewModel.didSelectItem(at: indexPath.row)}
}

extension BanksListViewController: UISearchBarDelegate
{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
        guard let searchText = searchBar.text, !searchText.isEmpty else { return }
        viewModel.didSearch(query: searchText)
        view.endEditing(true)
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar)
    {
        viewModel.didCancelSearch()
        view.endEditing(true)
    }
    
    func setUpSearchBar()
    {
        searchBar.delegate = self
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
    {
        if searchText.isEmpty
        {
            viewModel.didCancelSearch()
        }
        else
        {
            viewModel.didSearch(query: searchText)
        }
    }
}


