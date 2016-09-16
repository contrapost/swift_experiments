#!/usr/bin/env xcrun swift 

import Cocoa
import Foundation

if let text = readLine() {
    let array = text.components(separatedBy: " ")
    print(array.sorted { $0.localizedCaseInsensitiveCompare($1) == ComparisonResult.orderedAscending })
} else {
    print("No input.")
}
