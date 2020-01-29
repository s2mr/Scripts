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

        guard !files.isEmpty else {
            return print(.warn + "  Xcode project file not found.")
        }

        let preferredOpenFile = files.sorted(by: { lhs, rhs in lhs.absoluteString > rhs.absoluteString })[0]
        print(.rocket + "  Found \(preferredOpenFile.pathExtension).")
        NSWorkspace.shared.open(preferredOpenFile)
    }
}
