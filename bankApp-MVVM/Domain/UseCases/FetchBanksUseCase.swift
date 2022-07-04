//
//  FetchBanksUseCase.swift
//  bankApp-MVVM
//
//  Created by Cem Sertkaya on 3.07.2022.
//

import Foundation

protocol FetchBanksUseCase
{
    func execute(completion: @escaping (Result<[Bank], Error>) -> Void) -> Cancellable?
}

final class DefaultFetchBanksUseCase : FetchBanksUseCase
{
    private let banksRepository : BanksRepository
    
    init(banksRepository : BanksRepository) {self.banksRepository = banksRepository}
    
    func execute(completion: @escaping (Result<[Bank], Error>) -> Void) -> Cancellable?
    {
        return banksRepository.fetchBanksList { result in
            completion(result)
        }
    }
    
}
