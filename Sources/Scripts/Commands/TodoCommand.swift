import Foundation
import AppKit

class AppDelegate: NSObject, NSApplicationDelegate {
    let window = NSWindow(contentRect: NSMakeRect(200, 200, 400, 200),
                          styleMask: [.titled, .closable, .miniaturizable, .resizable],
                          backing: .buffered,
                          defer: false,
                          screen: nil)

    func applicationDidFinishLaunching(_ notification: Notification) {
        window.makeKeyAndOrderFront(nil)
        let field = NSTextView(frame: window.contentView!.bounds)
        field.backgroundColor = .white
        field.isContinuousSpellCheckingEnabled = true
        window.contentView?.addSubview(field)
        DispatchQueue(label: "background").async {
            while let str = readLine(strippingNewline: false) {
                DispatchQueue.main.async {
                    field.textStorage?.append(NSAttributedString(string: str))
                }
            }
            app.terminate(self)
        }
    }
}

struct TodoCommand: Commands {
    func execute() {
//        let windowCotnroller = NSWindowController()
//        let viewController = MyViewController()
//        viewController.view.layer?.backgroundColor = NSColor.red.cgColor
//        windowCotnroller.contentViewController = viewController
//        windowCotnroller.showWindow(self)
//        let url = URL(fileURLWithPath: "/System/Applications/Utilities/Terminal.app", isDirectory: true)
//        NSWorkspace.shared.open(url)
//        let task = Process()
//        task.launchPath = "/usr/bin/env"
//        task.arguments = ["echo Makefile | xargs vi"]
//        task.launch()
//        task.waitUntilExit()
    }
}
