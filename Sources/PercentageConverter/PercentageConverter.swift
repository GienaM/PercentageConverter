public final class PercentageConverter {

    // MARK: - Private properties

    private let values: [Double]

    private struct PercentInfo {
        let index: Int
        var percent: Int
        let reminder: Double
    }

    // MARK: - Initialization

    public init(values: [Double]) {
        self.values = values
    }

    public convenience init (values: Double...) {
        self.init(values: values)
    }

    // MARK: - Public methods

    public func percents() -> [Double] {
        let sum = values.reduce(0, +)

        return values.map {  $0 / sum * 100 }
    }

    public func roundedPercents() -> [Int] {
        let percentageList = percents()

        let total = Int(percentageList.reduce(0, +).rounded())

        var values = percentageList.enumerated().map {
            PercentInfo(
                index: $0.offset,
                percent: Int($0.element),
                reminder: $0.element.truncatingRemainder(dividingBy: 1))
        }.sorted(by: { $0.reminder > $1.reminder })

        var reminder = total - values.map { $0.percent }.reduce(0, +)

        for index in values.indices {
            if reminder == 0 { break }
            values[index].percent += 1
            reminder -= 1
        }

        return values.sorted(by: { $0.index < $1.index }).map { $0.percent }
    }
}
