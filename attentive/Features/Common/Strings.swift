//
//  Strings.swift
//  attentive
//
//  Created by Colin Chu on 2025-05-22.
//

import Foundation
import SwiftUI

extension String {
    func splitByLength(maxLength: Int) -> [String] {
        var result: [String] = []
        var currentSubstring = ""
        
        let words = self.split(separator: " ")
        
        for word in words {
            let wordStr = String(word)
            if currentSubstring.isEmpty {
                currentSubstring = wordStr
            } else if currentSubstring.count + wordStr.count + 1 <= maxLength {
                currentSubstring += " " + wordStr
            } else {
                result.append(currentSubstring)
                currentSubstring = wordStr
            }
        }
        
        if !currentSubstring.isEmpty {
            result.append(currentSubstring)
        }
        
        return result
    }
}

struct MultiLineText: View {
    let text: String
    let maxLength: Int
    let spacing: CGFloat
    let textFormatOptions: [ (Text) -> Text ]

    var body: some View {
        let lines = text.splitByLength(maxLength: maxLength)
        ZStack(alignment: .topLeading) {
            ForEach(lines.indices, id: \.self) { index in
                formattedText(for: lines[index])
                    .offset(y: -CGFloat(lines.count - 1 - index) * spacing)
            }
        }
    }
    
    private func formattedText(for line: String) -> Text {
        textFormatOptions.reduce(Text(line)) { partial, format in
            format(partial)
        }
    }
}
