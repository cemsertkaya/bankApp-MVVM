//
//  Bank.swift
//  bankApp-MVVM
//
//  Created by Cem Sertkaya on 3.07.2022.
//

import Foundation


struct Bank: Decodable
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
    
    enum CodingKeys: String, CodingKey
    {
        case id = "ID"
        case dcSEHIR = "dc_SEHIR"
        case dcILCE = "dc_ILCE"
        case dcBANKASUBE = "dc_BANKA_SUBE"
        case dcBANKATIPI = "dc_BANKA_TIPI"
        case dcBANKKODU = "dc_BANK_KODU"
        case dcADRESADI = "dc_ADRES_ADI"
        case dcADRES = "dc_ADRES"
        case dcPOSTAKODU = "dc_POSTA_KODU"
        case dcONOFFLINE = "dc_ON_OFF_LINE"
        case dcONOFFSITE = "dc_ON_OFF_SITE"
        case dcBOLGEKOORDINATORLUGU = "dc_BOLGE_KOORDINATORLUGU"
        case dcENYAKIMATM = "dc_EN_YAKIM_ATM"
    }
    
}

public enum DcBANKATIPI: String, Codable, Equatable {
    case normal = "Normal"
    case paraÇekYatır = "Para Çek Yatır"
}

public enum DcONOFFLINE: String, Codable, Equatable {
    case offLine = "Off Line"
    case onLine = "On Line"
}

public enum DcONOFFSITE: String, Codable, Equatable {
    case offSite = "Off Site"
    case onSite = "On Site"
}

