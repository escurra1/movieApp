//
//  Utils.swift
//  MovieTestingApp
//
//  Created by Escurra Colquis on 18/10/22.
//

import Foundation
import SwiftMessages
import Toast_Swift

class Utils: NSObject {
    static func showToast(message:String,duration:Double = 2.0, position:ToastPosition = .bottom) {
        let window = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .compactMap({$0 as? UIWindowScene})
            .first?.windows
            .filter({$0.isKeyWindow}).first
        window?.hideAllToasts()
        window?.makeToast(message, duration: duration, position: position)
    }
    
    static func showMessageTop(_ isValid: Bool, textBody: String) {
        if isValid == true {
            SwiftMessages.hideAll()
            SwiftMessages.pauseBetweenMessages = 0.0
            let view: MessageView
            view = try! SwiftMessages.viewFromNib()
            view.configureContent(title: "", body: textBody, iconImage: nil, iconText: nil, buttonImage: nil, buttonTitle: "", buttonTapHandler: { _ in
                SwiftMessages.hide()})
            view.accessibilityPrefix = NSLocalizedString("error", comment: "error")
            view.configureDropShadow()
            view.button?.isHidden = true
            var config = SwiftMessages.defaultConfig
            config.presentationStyle = .top
            config.presentationContext = .window(windowLevel: .statusBar)
            config.preferredStatusBarStyle = .lightContent
            config.interactiveHide = false
            config.duration = .seconds(seconds: 1.5)
            view.configureTheme(backgroundColor: UIColor.red, foregroundColor: UIColor.white, iconImage: nil, iconText: nil)
            config.dimMode = .gray(interactive: true)
            SwiftMessages.show(config: config, view: view)
        } else {
            SwiftMessages.hide()
            SwiftMessages.hideAll()
            SwiftMessages.pauseBetweenMessages = 0.0
        }
    }
    
    static func checkInternetConnection() -> Bool{
        var flag = false
        let reachability = Reachability()
        switch reachability?.connection {
        case .wifi, .cellular:
            flag = true
        default:
            flag = false
        }
        return flag
    }
    
    static func checkDataOrWifi() -> Reachability.Connection {
        guard let reachability = Reachability() else {
            return .none
        }
        return reachability.connection
    }
    
}
