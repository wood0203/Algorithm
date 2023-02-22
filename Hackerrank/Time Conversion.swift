import Foundation

/*
 * Complete the 'timeConversion' function below.
 *
 * The function is expected to return a STRING.
 * The function accepts STRING s as parameter.
 */

func timeConversion(s: String) -> String {
    let startIndex = s.index(s.startIndex, offsetBy: 2)
    let endIndex = s.index(s.endIndex, offsetBy: -3)
    let militaryTime = String(s[startIndex...endIndex])
    let hour = String(s.prefix(2))
    
    switch String(s.suffix(2)) {
    case "AM":
        if hour == "12" { return "00" + militaryTime }
        return hour + militaryTime
    default:
        if hour == "12" { return hour + militaryTime }
        return String(12 + Int(hour)!) + militaryTime
    }

}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let s = readLine() else { fatalError("Bad input") }

let result = timeConversion(s: s)

fileHandle.write(result.data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)

