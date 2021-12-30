//
//  String+.swift
//  testBareksa
//
//  Created by Jackie Leonardy on 30/12/21.
//

import Foundation

extension String {
    /// Converts a Double into string representation with percent symbol
    /// ```
    /// Convert 1.2345 to "1.23%"
    /// ```
    func addPrefix(string prefix: String) -> String {
        return self + prefix
    }
}
