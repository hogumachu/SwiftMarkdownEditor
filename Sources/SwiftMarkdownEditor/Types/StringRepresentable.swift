//
//  StringRepresentable.swift
//  SwiftMarkdownEditor
//
//  Created by 홍성준 on 3/19/25.
//

import Foundation

public protocol StringRepresentable {
  static func convert(_ rawValue: String) -> Self?
}
