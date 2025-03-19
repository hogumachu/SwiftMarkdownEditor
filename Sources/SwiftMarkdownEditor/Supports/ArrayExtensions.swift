//
//  ArrayExtensions.swift
//  SwiftMarkdownEditor
//
//  Created by 홍성준 on 3/19/25.
//

import Foundation

extension Array {
  
  subscript(safe index: Index) -> Element? {
    return indices ~= index ? self[index] : nil
  }
}
