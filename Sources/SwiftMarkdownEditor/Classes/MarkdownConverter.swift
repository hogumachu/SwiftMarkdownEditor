//
//  MarkdownConverter.swift
//  SwiftMarkdownEditor
//
//  Created by 홍성준 on 3/19/25.
//

import Down
import Foundation

public final class MarkdownConverter {
  private var text = ""
  private var lines: [Int] = []
  
  public init() {}
  
  public func render(_ content: String, offset: Int) throws -> [MarkdownNode] {
    text = content
    var sum = 0
    var counts: [Int] = []
    content
      .components(separatedBy: .newlines)
      .map(\.utf8.count)
      .forEach {
        counts.append(sum)
        sum += ($0 + 1)
      }
    lines = counts
    
    let result = try Down(markdownString: content).toDocument(.smart)
    return convertAllNodes(result, offset: offset)
  }
  
  private func convertAllNodes(_ node: Node, offset: Int) -> [MarkdownNode] {
    return node.children
      .reduce(
        makeMarkdownNodeIfEnabled(node, offset: offset).map { [$0] } ?? []
      ) { previous, next in
        previous + convertAllNodes(next, offset: offset)
      }
  }
  
  private func makeMarkdownNodeIfEnabled(_ node: Node, offset: Int) -> MarkdownNode? {
    let pointee = node.cmarkNode.pointee
    guard let type = MarkdownType.from(
      rawValue: Int(pointee.type),
      with: node.cmarkNode.headingLevel
    ) else {
      return nil
    }
    guard let startLine = lines[safe: Int(pointee.start_line) - 1],
          let endLine = lines[safe: Int(pointee.end_line) - 1] else {
      return nil
    }
    let start = startLine + Int(pointee.start_column) - 1
    let end = endLine + Int(pointee.end_column) - 1
    let fromIdx = text.utf8.index(text.utf8.startIndex, offsetBy: start)
    let range = text.utf8
      .index(text.utf8.startIndex, offsetBy: max(0, end), limitedBy: text.utf8.endIndex)
      .flatMap {
        guard $0 < text.utf8.endIndex && $0 > fromIdx else { return nil }
        let range = NSRange(fromIdx...$0, in: text)
        return NSRange(location: range.location + offset, length: range.length)
      } ?? NSRange(fromIdx..<text.utf8.endIndex, in: text)
    
    return MarkdownNode(
      range: range,
      type: type,
      headingLevel: node.cmarkNode.headingLevel
    )
  }
}
