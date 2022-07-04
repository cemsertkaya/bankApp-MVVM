//
//  BankListItemViewModel.swift
//  bankApp-MVVM
//
//  Created by Cem Sertkaya on 3.07.2022.
//

import Foundation


struct BanksListItemViewModel : Equatable
{
    let title: String
    let overview: String
    let releaseDate: String
    let posterImagePath: String?
}
