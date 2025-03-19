//
//  TextStorage.swift
//  SwiftMarkdownEditor
//
//  Created by 홍성준 on 3/19/25.
//

import UIKit

public final class TextStorage: NSTextStorage {
  public override init() {
    super.init()
  }
  
  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
