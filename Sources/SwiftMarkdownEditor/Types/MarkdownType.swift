//
//  MardownType.swift
//  SwiftMarkdownEditor
//
//  Created by 홍성준 on 3/19/25.
//

import Foundation

public enum MarkdownType: Equatable, CaseIterable {
  case quote
  case list
  case codeBlock
  case header(MarkdownHeaderLevel)
  case code
  case italic
  case bold
  case link
  case image
  case body
  
  public static let allCases: [MarkdownType] = [
    .quote,
    .list,
    .codeBlock,
    .code,
    .italic,
    .bold,
    .link,
    .image,
    .body
  ] + MarkdownHeaderLevel.allCases.map { .header($0) }
}

public enum MarkdownHeaderLevel: Int, Equatable, CaseIterable {
  case header1 = 1
  case header2
  case header3
  case header4
  case header5
  case header6
  
  static var `default`: MarkdownHeaderLevel { .header3 }
}
