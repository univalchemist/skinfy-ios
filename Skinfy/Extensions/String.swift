//
//  String.swift
//  Skinfy
//
//  Created by Algene Pulido on 10/14/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import Foundation

extension String {
    /**
     trim whitespaces and newlines at the beginning and ending of the string
     */
    func trim() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
