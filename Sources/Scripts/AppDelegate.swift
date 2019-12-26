import AppKit

final class AppDelegate: NSObject, NSApplicationDelegate {
    var applicationDidFinishLaunching: (() -> Void)?

    func applicationDidFinishLaunching(_ notification: Notification) {
        applicationDidFinishLaunching?()
    }
}

extension AppDelegate {
    static let shared = AppDelegate()
}
