//
//  LoginViewModel.swift
//  SNS Like UI
//
//  Created by 土橋正晴 on 2021/12/11.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    
    @Published var isAuth = false
    
    @Published var mailaddress = ""
    
    @Published var isMailAddress = false
    
    @Published var password = ""
    
    @Published var isPassword = false
    
    @Published var isAlert = false
    
    var cancellable: Set<AnyCancellable> = []
    
    
    init() {
        $mailaddress
            .map { text in
                text == "Hoge@hoge.com"
            }
            .sink { isMail in
                self.isMailAddress = isMail
            }
            .store(in: &cancellable)
        
        $password
            .map { text in
                text == "Hogehoge"
            }
            .sink { isPW in
                self.isPassword = isPW
            }
            .store(in: &cancellable)
    }
    
    
    
    func login() {
        if isMailAddress && isPassword {
            UserDefaults.standard.setBool(key: .auth, value: true)
            isAuth = UserDefaults.standard.getBool(key: .auth)
        } else {
            isAlert = true
        }
    }
    
    
    
    
}
