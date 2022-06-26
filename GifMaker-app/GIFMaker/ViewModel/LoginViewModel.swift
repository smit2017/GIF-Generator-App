//
//  LoginViewModel.swift
//  GIFMaker
//
//  Created by csuftitan on 6/21/22.
//

import SwiftUI
import Firebase
import LocalAuthentication

class LoginViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    
    //Note: FaceID Properties
    @AppStorage("use_face_id") var useFaceID: Bool = false
    @AppStorage("use_face_email") var faceIDEmail: String = ""
    @AppStorage("use_face_password") var faceIDPassword: String = ""
    
    //Login Status
    @AppStorage("log_status") var logStatus: Bool = false
    
    //Note: Error
    @Published var showError: Bool = false
    @Published var errorMsg: String = ""

    //Note: Firebase Login
    func loginUser(useFaceID: Bool,email: String = "", password: String = "")async throws{
        
        let _ = try await Auth.auth().signIn(withEmail: email != "" ? email : self.email, password: password != "" ? password: self.password)
        
        DispatchQueue.main.async {
            //Storing Once
            if useFaceID && self.faceIDEmail == ""{
                self.useFaceID = useFaceID
                //Note: Storing for Future FaceID Login
                self.faceIDEmail = self.email
                self.faceIDPassword = self.password
            }
            
            self.logStatus = true
        }
        
    }
    
    //Note: FaceID Usage
    func getBioMetricStatus() -> Bool{
        
        let scanner = LAContext()
        
        return scanner.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: .none)
        
    }
    
    //Note: FaceID Login
    func authenticateUser()async throws {
        
        let status = try await LAContext().evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "To Login Into App")

        if status{
            try await loginUser(useFaceID: useFaceID, email: self.faceIDEmail, password: self.faceIDPassword)
        }
    }
    
    
}
