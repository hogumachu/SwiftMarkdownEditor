//
//  MarkdownNode.swift
//  SwiftMarkdownEditor
//
//  Created by 홍성준 on 3/19/25.
//

import Foundation

import Down

public struct MarkdownNode: Equatable {
  public let range: NSRange
  public let rawType: Int
  public let type: MarkdownType
  public let headingLevel: Int
  
  public init(range: NSRange, type: MarkdownType, headingLevel: Int) {
    self.range = range
    self.rawType = type.rawValue
    self.type = type
    self.headingLevel = headingLevel
  }
}
