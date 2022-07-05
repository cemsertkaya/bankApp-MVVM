//
//  OpenMapDirection.swift
//  bankApp-MVVM
//
//  Created by Cem Sertkaya on 5.07.2022.
//

import CoreLocation
import MapKit
import UIKit

class OpenMapDirections {
    // If you are calling the coordinate from a Model, don't forgot to pass it in the function parenthesis.
    static func present(in viewController: UIViewController, sourceView: UIView, locationString : String) {
        let actionSheet = UIAlertController(title: "Open Location", message: "Choose an app to open direction", preferredStyle: .actionSheet)
       
        actionSheet.addAction(UIAlertAction(title: "Apple Maps", style: .default, handler: { _ in
            // Pass the coordinate that you want here
            let baseUrl: String = "http://maps.apple.com/?q="
            let encodedName = locationString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
            let finalUrl = baseUrl + encodedName
            if let url = URL(string: finalUrl)
            {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }))
        actionSheet.popoverPresentationController?.sourceRect = sourceView.bounds
        actionSheet.popoverPresentationController?.sourceView = sourceView
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        viewController.present(actionSheet, animated: true, completion: nil)
    }
}
