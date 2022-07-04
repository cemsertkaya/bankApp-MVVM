//
//  BankListViewModel.swift
//  bankApp-MVVM
//
//  Created by Cem Sertkaya on 3.07.2022.
//

import Foundation

struct BanksListViewModelActions
{
    let showBankDetails: (Bank) -> Void
}

enum BanksListViewModelLoading
{
    case fullScreen
    case nextPage
}

protocol BanksListViewModelInput
{
    func viewDidLoad()
    func didSearch(query: String)
    func didCancelSearch()
    func didSelectItem(at index: Int)
}

protocol BanksListViewModelOutput
{
    var items: Observable<[BanksListItemViewModel]> { get }
    var loading: Observable<BanksListViewModelLoading?> { get }
    var query: Observable<String> { get }
    var error: Observable<String> { get }
    var isEmpty: Bool { get }
    var errorTitle: String { get }
}

protocol BanksListViewModel: BanksListViewModelOutput, BanksListViewModelInput {}


final class DefaultBanksListViewModel : BanksListViewModel
{
    private let fetchBanksUseCase : FetchBanksUseCase
    private let actions : BanksListViewModelActions
    
    init(fetchBanksUseCase: FetchBanksUseCase, actions: BanksListViewModelActions)
    {
        self.fetchBanksUseCase = fetchBanksUseCase
        self.actions = actions
    }
    
    private var banks: [Bank] = []
    
    
    // MARK: - OUTPUT
    let items: Observable<[BanksListItemViewModel]> = Observable([])
    let loading: Observable<BanksListViewModelLoading?> = Observable(.none)
    let query: Observable<String> = Observable("")
    let error: Observable<String> = Observable("")
    var isEmpty: Bool { return items.value.isEmpty }
    let screenTitle = NSLocalizedString("Banks", comment: "")
    let emptyDataTitle = NSLocalizedString("Search results", comment: "")
    let errorTitle = NSLocalizedString("Error", comment: "")
    let searchBarPlaceholder = NSLocalizedString("Search Banks", comment: "")
    
    
}


extension DefaultBanksListViewModel
{
    func viewDidLoad() {}
    
    func didSearch(query: String) {}
    
    func didCancelSearch() {}
    
    func didSelectItem(at index: Int) {actions.showBankDetails(banks[index])}
}
