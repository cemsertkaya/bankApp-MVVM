//
//  BankListItemViewModel.swift
//  bankApp-MVVM
//
//  Created by Cem Sertkaya on 3.07.2022.
//

import Foundation


struct BanksListItemViewModel : Equatable
{
    let city: String
    let state: String
    let type : DcBANKATIPI
    let address : String?
    let closestATM : String?
    let bankArrayIndex : Int
}

extension BanksListItemViewModel {

    init(bank: Bank, index : Int)
    {
        self.city = bank.dcSEHIR ?? ""
        self.state =  bank.dcILCE ?? ""
        self.type =  bank.dcBANKATIPI ?? .normal
        self.address =  bank.dcADRES ?? ""
        self.closestATM =  bank.dcENYAKIMATM ?? ""
        self.bankArrayIndex = index
    }
}
