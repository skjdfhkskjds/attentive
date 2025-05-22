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
            VStack(alignment: .leading, spacing: -10) {
                Text(habit.name)
                    .font(Font.poppinsBold(48))
                    .bold()
                    .foregroundColor(ProfileTheme.text)
                Text(habit.description)
                    .font(Font.poppinsBold(16))
                    .bold()
                    .foregroundColor(ProfileTheme.text)
            }
            .padding(.top, 200)
            .frame(maxWidth: cardWidth-50, alignment: .leading)
            .background(
                CardContainer(
                    imageName: imageName,
                    cardWidth: cardWidth,
                    cardHeight: cardHeight
                )
            )
        }
        .opacity(opacity)
        .scaleEffect(scale)
        .offset(x: offset)
        .zIndex(zIndex)
    }
}

struct CardContainer: View {
    let imageName: String
    let cardWidth: CGFloat
    let cardHeight: CGFloat
    
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
        }
    }
}
