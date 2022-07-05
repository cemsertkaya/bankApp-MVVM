//
//  BankDetailsViewModel.swift
//  bankApp-MVVM
//
//  Created by Cem Sertkaya on 3.07.2022.
//

import Foundation
import UIKit
import FirebaseAnalytics

protocol BankDetailsViewModelOutput
{
    func getContent(index : Int) -> String
    
    func pushToMap(in viewController: UIViewController, sourceView: UIView) -> Void
    
    func viewDidLoad() -> Void
}

protocol BankDetailsViewModel: BankDetailsViewModelOutput {}

final class DefaultBankDetailsViewModel : BankDetailsViewModel
{
    // MARK: - OUTPUT

    
    let dcSEHIR: String!
    let dcILCE: String!
    let dcBANKASUBE: String!
    let dcBANKATIPI: DcBANKATIPI!
    let dcBANKKODU: String!
    let dcADRESADI: String!
    let dcADRES: String!
    let dcPOSTAKODU: String!
    let dcBOLGEKOORDINATORLUGU: String!
    let dcENYAKIMATM: String!
    
    init(bank: Bank)
    {
        self.dcSEHIR = bank.dcSEHIR ?? ""
        self.dcILCE = bank.dcILCE ?? ""
        self.dcBANKASUBE = bank.dcBANKASUBE ?? ""
        self.dcBANKATIPI = bank.dcBANKATIPI ?? .normal
        self.dcBANKKODU = bank.dcBANKKODU ?? ""
        self.dcADRESADI = bank.dcADRESADI ?? ""
        self.dcADRES = bank.dcADRES ?? ""
        self.dcPOSTAKODU = bank.dcPOSTAKODU ?? ""
        self.dcBOLGEKOORDINATORLUGU = bank.dcBOLGEKOORDINATORLUGU ?? ""
        self.dcENYAKIMATM = bank.dcENYAKIMATM ?? ""
    }
    
    
    func getContent(index: Int) -> String
    {
        switch index
        {
            case 0: return "Şehir: \(dcSEHIR!)"
            case 1: return "İlçe: \(dcILCE!)"
            case 2: return "Banka Şube: \(dcBANKASUBE!)"
            case 3: return "Banka Tipi: \(dcBANKATIPI!.rawValue)"
            case 4: return "Banka Kodu: \(dcBANKKODU!)"
            case 5: return "Adres Adı: \(dcADRESADI!)"
            case 6: return "Posta Kodu: \(dcPOSTAKODU!)"
            case 7: return "En Yakın Koordinatörlük: \(dcBOLGEKOORDINATORLUGU!)"
            case 8: return "En Yakın ATM: \(dcENYAKIMATM!)"
            case 9: return "Adres: \(dcADRES!)"
            default:return ""
        }
    }
    
    func pushToMap(in viewController: UIViewController, sourceView: UIView) {OpenMapDirections.present(in: viewController, sourceView: sourceView, locationString: self.dcADRES)}
    
    func viewDidLoad() {
        Analytics.logEvent(AnalyticsEventSelectContent, parameters: [
        AnalyticsParameterItemID: "id-BankDetails",
        AnalyticsParameterItemName: "BankDetails",
        AnalyticsParameterContentType: "cont",
        ])
        print("logged")
    }
}


