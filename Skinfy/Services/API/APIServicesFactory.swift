//
//  APIServicesFactory.swift
//  Skinfy
//
//  Created by Algene Pulido on 10/7/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import Foundation

class APIServicesFatory: BaseServiceFactory {
    func signInRequest() -> BaseRequest<SignInParam, SignInResultModel> {
        let request = urlRequest(path: "/auth/sign-in", method: .post)
        return BaseRequest<SignInParam, SignInResultModel>(request: request)
    }
    
    func emailExistRequest() -> BaseRequest<CheckExistEmailParam, CheckExistEmailResultModel> {
        let request = urlRequest(path: "/auth/check-exist-email", method: .post)
        return BaseRequest<CheckExistEmailParam, CheckExistEmailResultModel>(request: request)
    }
    
    func signUpRequest() -> BaseRequest<SignUpParam, SignUpResultModel> {
        let request = urlRequest(path: "/auth/sign-up", method: .post)
        return BaseRequest<SignUpParam, SignUpResultModel>(request: request)
    }
    
    func forgotPasswordRequest() -> BaseRequest<ForgotPasswordAPIParam, ForgotPasswordAPIResult> {
        let request = urlRequest(path: "/auth/forgot-password", method: .post)
        return BaseRequest<ForgotPasswordAPIParam, ForgotPasswordAPIResult>(request: request)
    }
    
    func facebookAuthRequest() -> BaseRequest<FBAuthAPIParam, SignInResultModel> {
        let request = urlRequest(path: "/auth/facebook", method: .post)
        return BaseRequest<FBAuthAPIParam, SignInResultModel>(request: request)
    }
    
    func profileRequest() -> BaseRequestSingle<ProfileAPIResultModel> {
        let request = urlRequest(path: "/profile", method: .get)
        return BaseRequestSingle<ProfileAPIResultModel>(request: request)
    }
    
    func editProfileRequest() -> BaseRequest<EditProfileAPIParam, EditProfileAPIResult> {
        let request = urlRequest(path: "/profile/edit-profile", method: .put)
        return BaseRequest<EditProfileAPIParam, EditProfileAPIResult>(request: request)
    }
    
    func changePasswordRequest() -> BaseRequest<ChangePasswordAPIParam, ChangePasswordAPIResult> {
        let request = urlRequest(path: "/profile/change-password", method: .put)
        return BaseRequest<ChangePasswordAPIParam, ChangePasswordAPIResult>(request: request)
    }
    
    func productListRequest() -> BaseRequestSingle<ListProductAPIResult> {
        let request = urlRequest(path: "/profile/get-list-product", method: .get)
        return BaseRequestSingle<ListProductAPIResult>(request: request)
    }
    
    func groupListRequest() -> BaseRequestSingle<GroupListAPIResult> {
        let request = urlRequest(path: "/profile/get-list-group", method: .get)
        return BaseRequestSingle<GroupListAPIResult>(request: request)
    }
    
    func editProductRequest(productId: String) -> BaseRequest<EditProductAPIParam, EditProductAPIResult> {
        let request = urlRequest(path: "/product/edit-product/\(productId)", method: .put)
        return BaseRequest<EditProductAPIParam, EditProductAPIResult>(request: request)
    }
    
    func deleteProductRequest(productId: String) -> BaseRequest<DeleteProductAPIParam, DeleteProductAPIResult> {
        let request = urlRequest(path: "/product/delete-product/\(productId)", method: .delete)
        return BaseRequest<DeleteProductAPIParam, DeleteProductAPIResult>(request: request)
    }
    
    func archiveProductRequest(productId: String) -> BaseRequestSingle<ArchiveProductAPIResult> {
        let request = urlRequest(path: "/profile/\(productId)/archive", method: .put)
        return BaseRequestSingle<ArchiveProductAPIResult>(request: request)
    }
    
    func unArchiveProductRequest(productId: String) -> BaseRequestSingle<ArchiveProductAPIResult> {
        let request = urlRequest(path: "/profile/\(productId)/un-archive", method: .put)
        return BaseRequestSingle<ArchiveProductAPIResult>(request: request)
    }
    
}
