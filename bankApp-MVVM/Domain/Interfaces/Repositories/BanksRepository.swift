//
//  BankRepository.swift
//  bankApp-MVVM
//
//  Created by Cem Sertkaya on 3.07.2022.
//

import Foundation

protocol BanksRepository
{
    @discardableResult
    func fetchBanksList(completion: @escaping (Result<[Bank],Error>) -> Void) -> Cancellable?
}
