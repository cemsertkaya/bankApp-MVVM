//
//  APIEndpoints.swift
//  bankApp-MVVM
//
//  Created by Cem Sertkaya on 3.07.2022.
//

import Foundation

struct APIEndpoints
{
    static func getBanks() -> Endpoint<Bank> {return Endpoint(path: "",method: .get)}
}
