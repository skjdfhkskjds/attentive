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
            ZStack(alignment: .topLeading) {
                MultiLineText(
                    text: habit.name,
                    maxLength: 8,
                    spacing: 48,
                    textFormatOptions: [
                        { $0.font(Font.poppinsBold(48)).bold() },
                        { $0.foregroundColor(ProfileTheme.text) }
                    ]
                )
                Text(habit.description)
                    .font(Font.poppinsBold(12))
                    .bold()
                    .foregroundColor(ProfileTheme.text)
                    .padding(.top, 54)
            }
            .padding(.top, 180)
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
        ZStack(alignment: .trailing) {
            RoundedRectangle(cornerRadius: 30)
                .fill(ProfileTheme.accentOnSurface)
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                // .frame(width: cardWidth * 0.55, height: cardHeight * 0.55)
                .frame(width: cardWidth, height: cardHeight)
                .padding(.trailing, cardWidth * 0.04)
        }
        .frame(width: cardWidth, height: cardHeight)
    }
}
