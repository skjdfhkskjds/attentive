import Foundation

enum MetricType {
    case binary
    case numeric(unit: String)
    case duration
    case timeOfDay
    case countable(options: [String])
}

enum MetricPeriod {
    case day
    case week
    case month
    case quarter
    case year
    case custom(from: Date, to: Date)
}

enum MetricValue {
    case binary(Bool)
    case numeric(Double)
    case duration(TimeInterval)
    case timeOfDay(Date)
    case countable([String])
}

struct MetricConfiguration {
    var type: MetricType
    var preferredVisualizations: [VisualizationType]
    var goalValue: Double?
    var unitLabel: String?
    var aggregationType: AggregationType
}

enum AggregationType {
    case sum
    case average
    case maximum
    case minimum
    case distribution
}

enum VisualizationType {
    case lineChart
    case barChart
    case scatterPlot
    case heatMap
    case progressBar
    case histogram
}

struct VisualizationConfig {
    var type: VisualizationType
    var period: MetricPeriod
    var showAverage: Bool
    var showGoal: Bool
    var annotations: [String: String]?
}

