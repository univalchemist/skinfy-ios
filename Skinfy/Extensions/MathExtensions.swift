//
//  MathExtensions.swift
//  Skinfy
//
//  Created by Algene Pulido on 9/25/20.
//  Copyright © 2020 Digiruu. All rights reserved.
//

import UIKit

extension BinaryInteger {
    var degreesToRadians: CGFloat { CGFloat(self) * .pi / 180 }
}

extension FloatingPoint {
    var degreesToRadians: Self { self * .pi / 180 }
    var radiansToDegrees: Self { self * 180 / .pi }
}
