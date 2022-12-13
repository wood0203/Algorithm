func solution(_ s:String) -> String {
    var str = Array(s).map({String($0)})
    str[0] = str[0].uppercased()
    
    for i in 1..<str.count {
        if str[i-1] == " " && Int(str[i]) == nil {
            str[i] = str[i].uppercased()
        } else { str[i] = str[i].lowercased() }
    }
    
    return String(str.joined())
}
