//
//  APIEndpointsProtocol.swift
//  Skinfy
//
//  Created by Algene Pulido on 10/7/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import PromiseKit

protocol APIEndpointsProtocol {
    func signIn(input: SignInParam) -> Promise<SignInResultModel>
    func emailExist(input: CheckExistEmailParam) -> Promise<CheckExistEmailResultModel>
    func signUp(input: SignUpParam) -> Promise<SignUpResultModel>
    func forgotPassword(input: ForgotPasswordAPIParam) -> Promise<ForgotPasswordAPIResult>
    func facebookAuth(input: FBAuthAPIParam) -> Promise<SignInResultModel>
    func profile() -> Promise<ProfileAPIResultModel>
    func editProfile(input: EditProfileAPIParam) -> Promise<EditProfileAPIResult>
    func changePassword(input: ChangePasswordAPIParam) -> Promise<ChangePasswordAPIResult>
    func productsList() -> Promise<ListProductAPIResult>
    func groupList() -> Promise<GroupListAPIResult>
    func deleteProduct(input: DeleteProductAPIParam) -> Promise<DeleteProductAPIResult>
    func editProduct(input: EditProductAPIParam) -> Promise<EditProductAPIResult>
    func archiveProduct(input: ArchiveProductAPIParam) -> Promise<ArchiveProductAPIResult>
    func unArchiveProduct(input: ArchiveProductAPIParam) -> Promise<ArchiveProductAPIResult>
}
