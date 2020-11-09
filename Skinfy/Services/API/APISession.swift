//
//  APISession.swift
//  Skinfy
//
//  Created by Algene Pulido on 10/6/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import Alamofire
import PromiseKit

class APISession: APIEndpointsProtocol {
                
    func signIn(input: SignInParam) -> Promise<SignInResultModel> {
        return Promise<SignInResultModel> { seal in
            PrivateManagerAPI.shared.run(request: APIServicesFatory().signInRequest(), input: input) { (response) in
                switch response {
                case .success(let signInResult):
                    seal.fulfill(signInResult)                    
                case .error(let error):
                    seal.reject(error.asError())                    
                }
            }
        }
    }
    
    func emailExist(input: CheckExistEmailParam) -> Promise<CheckExistEmailResultModel> {
        return Promise<CheckExistEmailResultModel> { seal in
            PrivateManagerAPI.shared.run(request: APIServicesFatory().emailExistRequest(), input: input) { (response) in
                switch response {
                case .success(let emailExistModel):
                    seal.fulfill(emailExistModel)
                case .error(let error):
                    seal.reject(error.asError())
                }
            }
        }
    }
    
    func signUp(input: SignUpParam) -> Promise<SignUpResultModel> {
        return Promise<SignUpResultModel> { seal in
            PrivateManagerAPI.shared.run(request: APIServicesFatory().signUpRequest(), input: input) { (response) in
                switch response {
                case .success(let result):
                    seal.fulfill(result)
                case .error(let error):
                    seal.reject(error.asError())
                }
            }
        }
    }
    
    func forgotPassword(input: ForgotPasswordAPIParam) -> Promise<ForgotPasswordAPIResult> {
        return Promise<ForgotPasswordAPIResult> { seal in
            PrivateManagerAPI.shared.run(request: APIServicesFatory().forgotPasswordRequest(), input: input) { (response) in
                switch response {
                case .success(let result):
                    seal.fulfill(result)
                case .error(let error):
                    seal.reject(error.asError())
                }
            }
        }
    }
    
    func facebookAuth(input: FBAuthAPIParam) -> Promise<SignInResultModel> {
        return Promise<SignInResultModel> { seal in
            PrivateManagerAPI.shared.run(request: APIServicesFatory().facebookAuthRequest(), input: input) { (response) in
                switch response {
                case .success(let result):
                    seal.fulfill(result)
                case .error(let error):
                    seal.reject(error.asError())
                }
            }
        }
    }
    
    func profile() -> Promise<ProfileAPIResultModel> {
        return Promise<ProfileAPIResultModel> { seal in
            PrivateManagerAPI.shared.run(request: APIServicesFatory().profileRequest()) { (response) in
                switch response {
                case .success(let result):
                    seal.fulfill(result)
                case .error(let error):
                    seal.reject(error.asError())
                }
            }
        }
    }
    
    func editProfile(input: EditProfileAPIParam) -> Promise<EditProfileAPIResult> {
        return Promise<EditProfileAPIResult> { seal in
            PrivateManagerAPI.shared.run(request: APIServicesFatory().editProfileRequest(), input: input) { (response) in
                switch response {
                case .success(let result):
                    seal.fulfill(result)                    
                case .error(let error):
                    seal.reject(error.asError())
                }
            }
        }
    }
    
    func changePassword(input: ChangePasswordAPIParam) -> Promise<ChangePasswordAPIResult> {
        return Promise<ChangePasswordAPIResult> { seal in
            PrivateManagerAPI.shared.run(request: APIServicesFatory().changePasswordRequest(), input: input) { (response) in
                switch response {
                case .success(let result):
                    seal.fulfill(result)
                case .error(let error):
                    seal.reject(error.asError())
                }
            }
        }
    }
    
    func productsList() -> Promise<ListProductAPIResult> {
        return Promise<ListProductAPIResult> { seal in
            PrivateManagerAPI.shared.run(request: APIServicesFatory().productListRequest()) { (response) in
                switch response {
                case .success(let result):
                    seal.fulfill(result)
                case .error(let error):
                    seal.reject(error.asError())
                }
            }
        }
    }
    
    func groupList() -> Promise<GroupListAPIResult> {
        return Promise<GroupListAPIResult> { seal in
            PrivateManagerAPI.shared.run(request: APIServicesFatory().groupListRequest()) { (response) in
                switch response {
                case .success(let result):
                    seal.fulfill(result)
                case .error(let error):
                    seal.reject(error.asError())
                }
            }
        }
    }
    
    func deleteProduct(input: DeleteProductAPIParam) -> Promise<DeleteProductAPIResult> {
        return Promise<DeleteProductAPIResult> { seal in
            PrivateManagerAPI.shared.run(request: APIServicesFatory().deleteProductRequest(productId: input.id), input: input) { (response) in
                switch response {
                case .success(let result):
                    seal.fulfill(result)
                case .error(let error):
                    seal.reject(error.asError())
                }
            }
        }
    }
    
    func editProduct(input: EditProductAPIParam) -> Promise<EditProductAPIResult> {
        return Promise<EditProductAPIResult> { seal in
            PrivateManagerAPI.shared.run(request: APIServicesFatory().editProductRequest(productId: input.id)) { (response) in
                switch response {
                case .success(let result):
                    seal.fulfill(result)
                case .error(let error):
                    seal.reject(error.asError())
                }
            }
        }
    }
    
    func archiveProduct(input: ArchiveProductAPIParam) -> Promise<ArchiveProductAPIResult> {
        return Promise<ArchiveProductAPIResult> { seal in
            PrivateManagerAPI.shared.run(request: APIServicesFatory().archiveProductRequest(productId: input.id)) { (response) in
                switch response {
                case .success(let result):
                    seal.fulfill(result)
                case .error(let error):
                    seal.reject(error.asError())
                }
            }
        }
    }
    
    func unArchiveProduct(input: ArchiveProductAPIParam) -> Promise<ArchiveProductAPIResult> {
        return Promise<ArchiveProductAPIResult> { seal in
            PrivateManagerAPI.shared.run(request: APIServicesFatory().unArchiveProductRequest(productId: input.id)) { (response) in
                switch response {
                case .success(let result):
                    seal.fulfill(result)
                case .error(let error):
                    seal.reject(error.asError())
                }
            }
        }
    }
    
}
