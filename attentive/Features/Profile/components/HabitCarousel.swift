//
//  ProfileTheme.swift
//  attentive
//
//  Created by Colin Chu on 2025-05-21.
//

import Foundation
import SwiftUI

struct HabitCarouselView: View {
    var habits: [Habit]
    @State private var snappedItem = 0.0
    @State private var draggingItem = 0.0
    @State var activeIndex: Int = 0

    var body: some View {
        ZStack {
            ForEach(habits) { item in
                HabitCardView(
                    habit: item,
                    imageName: "Cards/HabitCardCovers",
                    cardWidth: 292,
                    cardHeight: 383,
                    opacity: 1.0 - abs(distance(item.id)) * 0.4,
                    scale: 1.0 - abs(distance(item.id)) * 0.2,
                    offset: myXOffset(item.id),
                    zIndex: 1.0 - abs(distance(item.id)) * 0.1
                )

                .onTapGesture {
                    withAnimation {
                        draggingItem = Double(item.id)
                    }
                }
            }
        }
        .gesture(getDragGesture())
    }

    private func getDragGesture() -> some Gesture {
        
        DragGesture()
            .onChanged { value in
                draggingItem = snappedItem + value.translation.width / 100
            }
            .onEnded { value in
                withAnimation {
                    draggingItem = snappedItem + value.predictedEndTranslation.width / 100
                    draggingItem = round(draggingItem).remainder(dividingBy: Double(habits.count))
                    snappedItem = draggingItem
                    
                    //Get the active Item index
                    self.activeIndex = habits.count + Int(draggingItem)
                    if self.activeIndex > habits.count || Int(draggingItem) >= 0 {
                        self.activeIndex = Int(draggingItem)
                    }
                }
            }
    }
    
    func distance(_ item: Int) -> Double {
        return (draggingItem - Double(item)).remainder(dividingBy: Double(habits.count))
    }
    
    func myXOffset(_ item: Int) -> Double {
        let angle = Double.pi * 2 / Double(habits.count) * distance(item)
        return sin(angle) * 75
    }
}
