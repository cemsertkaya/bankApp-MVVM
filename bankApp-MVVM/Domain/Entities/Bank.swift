//
//  Bank.swift
//  bankApp-MVVM
//
//  Created by Cem Sertkaya on 3.07.2022.
//

import Foundation


struct Bank: Equatable
{
    public let id: Int?
    public let dcSEHIR: String?
    public let dcILCE: String?
    public let dcBANKASUBE: String?
    public let dcBANKATIPI: DcBANKATIPI?
    public let dcBANKKODU: String?
    public let dcADRESADI: String?
    public let dcADRES: String?
    public let dcPOSTAKODU: String?
    public let dcONOFFLINE: DcONOFFLINE?
    public let dcONOFFSITE: DcONOFFSITE?
    public let dcBOLGEKOORDINATORLUGU: String?
    public let dcENYAKIMATM: String?
}

enum DcBANKATIPI: Equatable
{
    case normal
    case paraÇekYatır
}

enum DcONOFFLINE: Equatable
{
    case offLine
    case onLine
}

enum DcONOFFSITE: Equatable
{
    case offSite
    case onSite
}

