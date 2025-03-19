//
//  MarkdownStylable.swift
//  SwiftMarkdownEditor
//
//  Created by 홍성준 on 3/19/25.
//

import Foundation

public struct MarkdownStyle {
  public var attributes: [NSAttributedString.Key: Any] = [:]
  
  public init() {}
}

public protocol MarkdownStylable {
  func style(type: MarkdownType) -> MarkdownStyle
}
