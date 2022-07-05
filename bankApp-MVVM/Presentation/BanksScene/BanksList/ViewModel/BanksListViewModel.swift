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
    private var banksLoadTask: Cancellable? { willSet { banksLoadTask?.cancel() } }
    
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
    

    
    private func appendBanks(_ banks: [Bank])
    {
        self.banks = banks
        for bank in self.banks
        {
            self.items.value.append(BanksListItemViewModel(bank: bank))
        }
    }
    
    private func load(loading: BanksListViewModelLoading)
    {
        self.loading.value = loading
        banksLoadTask = fetchBanksUseCase.execute(
           
            completion: { result in
                switch result
                {
                    case .success(let banks):
                        self.appendBanks(banks)
                    case .failure(let error):
                        self.handle(error: error)
                }
                self.loading.value = .none
        })
    }
    
    private func handle(error: Error)
    {
        self.error.value = error.isInternetConnectionError ?
            NSLocalizedString("No internet connection", comment: "") :
            NSLocalizedString("Failed loading movies", comment: "")
    }
}




extension DefaultBanksListViewModel
{
    func viewDidLoad() {load(loading: .fullScreen)}
    
    func didSearch(query: String) {}
    
    func didCancelSearch() {}
    
    func didSelectItem(at index: Int) {actions.showBankDetails(banks[index])}
}




