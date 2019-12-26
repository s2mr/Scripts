import AppKit

final class WindowCommand: Commands {
    func execute() {
        AppDelegate.shared.applicationDidFinishLaunching = { [weak self] in
            self?.showWindow()
        }
        NSApplication.shared.run()
    }

    private func showWindow() {
        let window = NSWindow(contentRect: NSMakeRect(200, 200, 400, 200),
                              styleMask: [.titled, .closable, .miniaturizable, .resizable],
                              backing: .buffered,
                              defer: false,
                              screen: nil)
        window.level = .mainMenu
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
        }
    }
}
