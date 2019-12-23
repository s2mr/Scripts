enum CommandList: String, CaseIterable {
    case today, tomorrow

    var overview: String {
        switch self {
        case .today:
            return "Print date of today"

        case .tomorrow:
            return "Print date of tomorrow"
        }
    }

    var command: Commands.Type {
        switch self {
        case .today:
            return TodayCommand.self

        case .tomorrow:
            return TodayCommand.self
        }
    }
}
