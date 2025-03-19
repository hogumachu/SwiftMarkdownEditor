//
//  MarkdownTypeExtensions.swift
//  SwiftMarkdownEditor
//
//  Created by 홍성준 on 3/19/25.
//

import Foundation

extension MarkdownType {
  
  var rawValue: Int {
    switch self {
    case .quote: return 2
    case .list: return 4
    case .codeBlock: return 5
    case .header: return 9
    case .code: return 14
    case .italic: return 17
    case .bold: return 18
    case .link: return 19
    case .image: return 20
    case .body: return 21
    }
  }
  
  static func from(rawValue: Int, with headingLevel: Int) -> MarkdownType? {
    switch rawValue {
    case 2: return MarkdownType.quote
    case 4: return MarkdownType.list
    case 5: return MarkdownType.codeBlock
    case 9: return MarkdownType.header(for: headingLevel)
    case 14: return MarkdownType.code
    case 17: return MarkdownType.italic
    case 18: return MarkdownType.bold
    case 19: return MarkdownType.link
    case 20: return MarkdownType.image
    case 21: return MarkdownType.body
    default: return nil
    }
  }
  
  private static func header(for rawValue: Int) -> MarkdownType {
    let level = MarkdownHeaderLevel(rawValue: rawValue) ?? .default
    return .header(level)
  }
}

extension MarkdownType: StringRepresentable {
  public static func convert(_ rawValue: String) -> MarkdownType? {
    switch rawValue {
    case "body": return .body
    case "h1": return .header(.header1)
    case "h2": return .header(.header2)
    case "h3": return .header(.header3)
    case "h4": return .header(.header4)
    case "h5": return .header(.header5)
    case "h6": return .header(.header6)
    case "inlineCode": return .code
    case "codeBlock": return .codeBlock
    case "link": return .link
    case "image": return .image
    case "bold": return .bold
    case "italic": return .italic
    case "blockQuote": return .quote
    case "list": return .list
    default: return nil
    }
  }
}
