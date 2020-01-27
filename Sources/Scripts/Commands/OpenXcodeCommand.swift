import Foundation
import AppKit

struct OpenXcodeCommand: Commands {
    func execute() {
        let fileManager = FileManager.default
        let currentDirectoryURL = URL(fileURLWithPath: fileManager.currentDirectoryPath, isDirectory: true)
        let files = ((try? fileManager.contentsOfDirectory(at: currentDirectoryURL, includingPropertiesForKeys: nil, options: [.skipsHiddenFiles])) ?? [])
            .filter {
                switch $0.pathExtension {
                case "xcodeproj",
                     "xcworkspace":
                    return true

                default:
                    return false
                }
        }

        files.forEach { print($0.pathExtension) }

        guard !files.isEmpty else {
            return print("Xcode project file not found")
        }

        let preferredOpenFile = files.sorted(by: { lhs, rhs in lhs.absoluteString < rhs.absoluteString })[0]
        NSWorkspace.shared.open(preferredOpenFile)
    }
}
