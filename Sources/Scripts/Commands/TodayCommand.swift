import Foundation

struct TodayCommand: Commands {
    func execute() {
        let dateComponents = Calendar.autoupdatingCurrent.dateComponents([.year, .month, .day], from: Date())
        guard let year = dateComponents.year, let month = dateComponents.month, let day = dateComponents.day else { return }
        print(String(format: "Today is %04d%02d%02d !", year, month, day))
    }
}
