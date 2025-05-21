//
//  ProfileTheme.swift
//  attentive
//
//  Created by Colin Chu on 2025-05-21.
//

import Foundation
import SwiftUI

struct TodoEntryView: View {
    let text: String
    var body: some View {
        HStack(spacing: 8) {
            RoundedRectangle(cornerRadius: 3)
                .stroke(Color(hex: "#437D9E"), lineWidth: 1)
                .frame(width: 12, height: 12)
            Text(text)
                .font(.custom("Poppins-SemiBold", size: 12))
                .foregroundColor(Color(hex: "#437D9E"))
            Spacer()
        }
        .frame(height: 20)
    }
}
