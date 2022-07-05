//
//  BanksSceneDIContainer.swift
//  bankApp-MVVM
//
//  Created by Cem Sertkaya on 3.07.2022.
//

import Foundation
import UIKit


final class BanksSceneDIContainer
{
    
    struct Dependencies {let apiDataTransferService: DataTransferService}
    
    private let dependencies: Dependencies
    
    init(dependencies: Dependencies) {self.dependencies = dependencies}

    // MARK: - Use Cases
    func makeFetchBanksUseCase() -> FetchBanksUseCase {return DefaultFetchBanksUseCase(banksRepository: makeBankRepository())}
    
    // MARK: - Repositories
    func makeBankRepository() -> BanksRepository {return DefaultBanksRepository(dataTransferService: dependencies.apiDataTransferService)}
    
    // MARK: - Banks List
    
    func makeBanksListViewController(actions: BanksListViewModelActions) -> BanksListViewController
    {
        return BanksListViewController.create(with: makeBanksListViewModel(actions: actions))
    }
    
    func makeBanksListViewModel(actions: BanksListViewModelActions) -> BanksListViewModel
    {
        return DefaultBanksListViewModel(fetchBanksUseCase: makeFetchBanksUseCase(), actions: actions)
    }
    
    // MARK: - Bank Details
    
    func makeBankDetailsViewController(bank: Bank) -> BankDetailsViewController
    {
        return BankDetailsViewController.create(with: makeBanksDetailsViewModel(bank: bank))
    }
    
    func makeBanksDetailsViewModel(bank: Bank) -> BankDetailsViewModel
    {
        return DefaultBankDetailsViewModel(bank: bank)
    }
    
    // MARK: - Flow Coordinators
    func makeBanksSearchFlowCoordinator(navigationController: UINavigationController) -> BanksFlowCoordinator
    {
        return BanksFlowCoordinator(navigationController: navigationController, dependencies: self)
    }
}

extension BanksSceneDIContainer: BanksFlowCoordinatorDependencies {}
