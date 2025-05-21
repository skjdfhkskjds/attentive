import Foundation

enum AggregationType: Hashable {
    case sum
    case average
    case maximum
    case minimum
    case distribution
}

enum VisualizationType: Hashable {
    case lineChart
    case barChart
    case scatterPlot
    case heatMap
    case progressBar
    case histogram
    case pieChart
}

struct VisualizationConfig : Hashable {
    var type: VisualizationType
    var period: MetricPeriod
    var showAverage: Bool
    var showGoal: Bool
    var annotations: [String: String]?
}

