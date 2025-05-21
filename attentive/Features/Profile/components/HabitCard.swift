//
//  ProfileTheme.swift
//  attentive
//
//  Created by Colin Chu on 2025-05-21.
//

import Foundation
import SwiftUI

struct HabitCardView: View {
    let habit: Habit
    let imageName: String
    let cardWidth: CGFloat
    let cardHeight: CGFloat
    let opacity: Double
    let scale: Double
    let offset: CGFloat
    let zIndex: Double

    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 30)
                .fill(ProfileTheme.accentOnSurface)
                .frame(width: cardWidth, height: cardHeight)
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: cardWidth-50, height: cardHeight-50)
                .padding(.leading, 50)
            VStack(alignment: .leading, spacing: 0) {
                Text(habit.name)
                    .font(.custom(ProfileTheme.poppinsBold, size: 48))
                    .bold()
                    .foregroundColor(ProfileTheme.text)
                Text(habit.description)
                    .font(.custom(ProfileTheme.poppinsBold, size: 16))
                    .bold()
                    .foregroundColor(ProfileTheme.text)
            }
            .padding(.top, 200)
        }
        .opacity(opacity)
        .scaleEffect(scale)
        .offset(x: offset)
        .zIndex(zIndex)
    }
}
