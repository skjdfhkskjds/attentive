import Foundation

enum MetricType: Hashable {
    case binary
    case numeric(unit: String)
    case duration
    case timeOfDay
    case countable(options: [String])
}

enum MetricPeriod: Hashable {
    case day
    case week
    case month
    case quarter
    case year
    case custom(from: Date, to: Date)
}

enum MetricValue: Hashable {
    case binary(Bool)
    case numeric(Double)
    case duration(TimeInterval)
    case timeOfDay(Date)
    case countable([String])
}

struct MetricConfiguration: Hashable {
    var type: MetricType
    var preferredVisualizations: [VisualizationType]
    var goalValue: Double?
    var unitLabel: String?
    var aggregationType: AggregationType
}

struct MetricEntry: Hashable {
    var logDate: Date
    var value: MetricValue
}

extension MetricEntry: Dated {
    var date: Date {
        return logDate
    }
}

struct Metric: Identifiable, Hashable {
    var id: Int
    var name: String
    var config: MetricConfiguration
    var entries: [MetricEntry]
}

extension Array where Element: Dated {
    func groupedBy(dateComponents: Set<Calendar.Component>) -> [Date: [Element]] {
        let initial: [Date: [Element]] = [:]
        let groupedByDateComponents = reduce(into: initial) { acc, cur in
            let components = Calendar.current.dateComponents(dateComponents, from: cur.date)
            let date = Calendar.current.date(from: components)!
            let existing = acc[date] ?? []
            acc[date] = existing + [cur]
        }
        
        return groupedByDateComponents
    }
}

extension Metric {
    func groupedBy(dateComponents: Set<Calendar.Component>) -> [Date: [MetricEntry]] {
        return entries.groupedBy(dateComponents: dateComponents)
    }
}
