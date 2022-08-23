//
//  Word.swift
//  Duolingo
//
//  Created by GOURAVM on 22/08/22.
//

import UIKit

struct Word: Identifiable, Hashable,Equatable {
    var id = UUID().uuidString
    var value: String
    var padding: CGFloat = 10
    var textSize: CGFloat = .zero
    var fontSize: CGFloat = 19
    var isShowing: Bool = false
}


