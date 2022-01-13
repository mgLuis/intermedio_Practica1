import Foundation

let student = ["name": "roger", "age": 30] as [String: AnyObject]

do {
    let data = try JSONSerialization.data(withJSONObject: student, options: [])
    print(String(data: data, encoding: .utf8)! )
} catch {
    print(error)
}


