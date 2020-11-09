//
//  BaseErrorModel.swift
//  Skinfy
//
//  Created by Algene Pulido on 10/7/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import Foundation

enum BaseAPIError: Error {
    case unknown
    case serverError(String)
}

class BaseErrorModel: Codable {
    var error: String = ""
    init() {}
    
    convenience init(errorString: String) {
        self.init()
        self.error = errorString
    }
    
    convenience init(error: Error) {
        self.init()
        self.error = error.localizedDescription
    }
    
    static var defaultError: BaseErrorModel {
        return BaseErrorModel(errorString: "Something went wrong")
    }
    
    func asError() -> Error {
        return ErrorMessage(title: "", message: self.error)
    }
}

struct ErrorMessage: Error {
    
    // MARK: - Properties
    public let title: String
    public let message: String
    
    // MARK: - Methods
    init(title: String, message: String) {
        self.title = title
        self.message = message
    }
    
    init(error: BaseErrorModel) {
        self.title = ""
        self.message = error.error
    }
    
    static var EmptyError: ErrorMessage {
        return ErrorMessage(title: "", message: "")
    }
    
    static var UnknownError: ErrorMessage {
        return ErrorMessage(error: BaseErrorModel.defaultError)
    }
}
