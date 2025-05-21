//
//  MockUserData.swift
//  attentive
//
//  Created by Colin Chu on 2025-05-21.
//

import Foundation

var defaultUser: User = User(
    id: UUID(),
    name: "Colin Chu",
    email: "colin.chu@example.com",
    password: "password",
    habits: [
        Habit(
            id: 0,
            name: "Water",
            description: "Stay hydrated.",
            metrics: [
                Metric(
                    id: 0,
                    name: "Checkins",
                    config: MetricConfiguration(
                        type: .numeric(unit: ""),
                        preferredVisualizations: [.heatMap],
                        goalValue: 4,
                        aggregationType: .sum
                    ),
                    entries: []
                )
            ],
            createdAt: Date(),
            updatedAt: Date()
        ),
        Habit(
            id: 1,
            name: "Focus",
            description: "Time to lock in.",
            metrics: [
                Metric(
                    id: 0,
                    name: "Checkins",
                    config: MetricConfiguration(
                        type: .numeric(unit: ""),
                        preferredVisualizations: [.heatMap],
                        goalValue: 4,
                        aggregationType: .sum
                    ),
                    entries: []
                ),
                Metric(
                    id: 1,
                    name: "Hours Tracked",
                    config: MetricConfiguration(
                        type: .numeric(unit: "hours"),
                        preferredVisualizations: [.barChart],
                        goalValue: 8,
                        aggregationType: .sum
                    ),
                    entries: []
                ),
                Metric(
                    id: 2,
                    name: "Focus Time",
                    config: MetricConfiguration(
                        type: .numeric(unit: "%"),
                        preferredVisualizations: [.pieChart],
                        goalValue: 1,
                        aggregationType: .sum
                    ),
                    entries: []
                ),
                Metric(
                    id: 3,
                    name: "Sessions",
                    config: MetricConfiguration(
                        type: .numeric(unit: ""),
                        preferredVisualizations: [.lineChart],
                        goalValue: 1,
                        aggregationType: .distribution
                    ),
                    entries: []
                )
            ],
            createdAt: Date(),
            updatedAt: Date()
        ),
        Habit(
            id: 2,
            name: "Water Plants",
            description: "Them bitches thirsty.",
            metrics: [
                Metric(
                    id: 0,
                    name: "Checkins",
                    config: MetricConfiguration(
                        type: .numeric(unit: ""),
                        preferredVisualizations: [.heatMap],
                        goalValue: 4,
                        aggregationType: .sum
                    ),
                    entries: []
                )
            ],
            createdAt: Date(),
            updatedAt: Date()
        )
    ],
    tasks: [
        Task(
            id: 0,
            title: "Buy shelf organizers",
            description: "Buy shelf organizers",
            dueDate: Date(),
            isCompleted: false,
            createdAt: Date(),
            updatedAt: Date()
        ),
        Task(
            id: 1,
            title: "Set up accounts",
            description: "Set up accounts",
            dueDate: Date(),
            isCompleted: false,
            createdAt: Date(),
            updatedAt: Date()
        ),
        Task(
            id: 2,
            title: "Call the bank",
            description: "Call the bank",
            dueDate: Date(),
            isCompleted: false,
            createdAt: Date(),
            updatedAt: Date()
        )
    ],
    createdAt: Date(),
    updatedAt: Date()
)
