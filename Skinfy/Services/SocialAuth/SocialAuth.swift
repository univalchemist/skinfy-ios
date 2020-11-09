//
//  SocialAuth.swift
//  Skinfy
//
//  Created by Algene Pulido on 10/15/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import Foundation
import FBSDKLoginKit
import AuthenticationServices
import PromiseKit
import SwiftKeychainWrapper

class SocialAuth: NSObject {
    typealias AppleSignInCompletionBlock = (_ id: String?, _ email: String?, _ firstName: String?, _ lastName: String?, _ error: BaseErrorModel?) -> Void
    private var vc: UIViewController?
    private var appleSignInCompletion: AppleSignInCompletionBlock?
    
    func facebookLogout() {
        LoginManager().logOut()
    }
    
    private func facebookAPIAuth(resolver: Resolver<SignInResultModel>) {
        let accessToken = AccessToken.current?.tokenString ?? ""
        APISession().facebookAuth(input: FBAuthAPIParam(token: accessToken)).done { (signInResultModel) in
            resolver.fulfill(signInResultModel)
        }.catch { (error) in
            resolver.reject(error)
        }
    }
    
    func facebookSignIn(vc: UIViewController) -> Promise<SignInResultModel> {
        return Promise<SignInResultModel> { seal in
            if (AccessToken.current != nil) {
                //already signed-in
                self.facebookAPIAuth(resolver: seal)
            } else {
                let login = LoginManager()
                login.logIn(permissions: ["email", "public_profile"], from: vc) { (result, error) in
                    if error != nil {
                        seal.reject(error!)
                    } else if result?.grantedPermissions.contains("public_profile") ?? false {
                        self.facebookAPIAuth(resolver: seal)
                    }
                }
            }
        }
    }
    
    func appleSignIn(vc: UIViewController, completion: @escaping AppleSignInCompletionBlock) {
        if #available(iOS 13.0, *) {
            self.vc = vc
            self.appleSignInCompletion = completion
            let appleIDProvider = ASAuthorizationAppleIDProvider()
            let request = appleIDProvider.createRequest()
            request.requestedScopes = [.fullName, .email]
            
            let authorizationController = ASAuthorizationController(authorizationRequests: [request])
            authorizationController.delegate = self
            authorizationController.presentationContextProvider = self
            authorizationController.performRequests()
        } else {
            // Fallback on earlier versions
        }        
    }
    
}

extension SocialAuth: ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    
    @available(iOS 13.0, *)
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.vc!.view.window!
    }
    
    @available(iOS 13.0, *)
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        let errorForRevoking = "Unable to Sign In. Please revoke your Apple SignIn in your Apple ID Settings then try again"
        switch authorization.credential {
        case let appleIDCredential as ASAuthorizationAppleIDCredential:
                        
            let userIdentifier = appleIDCredential.user
            let fullName = appleIDCredential.fullName
            var email = appleIDCredential.email
            if (email == nil) {
                //try to check if it's already saved in keychain
                let retrievedEmail: String? = KeychainWrapper.standard.string(forKey: userIdentifier)
                if (retrievedEmail != nil) {
                    email = retrievedEmail
                }
            } else {
                //apple sign-in process: we can only get the email in the initial apple sign-in process.
                //we save it to keychain with the userIdentifier as the key
                let res: Bool = KeychainWrapper.standard.set(email!,forKey: userIdentifier)
                if (!res) {
                    self.appleSignInCompletion!(nil, nil, nil, nil, BaseErrorModel(errorString: errorForRevoking))
                    return
                }
            }
            
            guard email != nil else {
                //apple account has no email
                self.appleSignInCompletion!(nil, nil, nil, nil, BaseErrorModel(errorString: errorForRevoking))
                return
            }
            
            self.appleSignInCompletion!(userIdentifier, email!, fullName?.givenName, fullName?.familyName, nil)
            
        case _ as ASPasswordCredential:
            break
        default:
            self.appleSignInCompletion!(nil, nil, nil, nil, BaseErrorModel(errorString: "Apple SignIn Authorization Unknown Error"))
            break
        }
    }
    
    @available(iOS 13.0, *)
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        if let err = error as? ASAuthorizationError {
            switch err.code {
            case .canceled:
                break
            case .unknown:
                self.appleSignInCompletion!(nil, nil, nil, nil, BaseErrorModel(errorString: "Unknown error! Please try again later or try other Sign In options."))
            case .invalidResponse:
                self.appleSignInCompletion!(nil, nil, nil, nil, BaseErrorModel(errorString: "Invalid Response! Please try again later or try other Sign In options."))
            case .notHandled:
                self.appleSignInCompletion!(nil, nil, nil, nil, BaseErrorModel(errorString: "Error not handled! Please try again later or try other Sign In options."))
            case .failed:
                self.appleSignInCompletion!(nil, nil, nil, nil, BaseErrorModel(errorString: "Failed! Please try again later or try other Sign In options."))
            @unknown default:
                self.appleSignInCompletion!(nil, nil, nil, nil, BaseErrorModel(errorString: "Fatal Error! Please try again later or try other Sign In options."))
            }
        } else {
            //Unknown error
            self.appleSignInCompletion!(nil, nil, nil, nil, BaseErrorModel(errorString: "Critical Error! Please try again later or try other Sign In options."))
        }
    }
    
}
