//import Foundation
//
//let n = Int(readLine()!)!
//for _ in 0..<n {
//    let ve = readLine()!.components(separatedBy: " ").map({Int($0)!})
//    var graph = Array(repeating: [], count: ve[0]+1)
//    var visited = Array(repeating: (false, 0), count: ve[0]+1)
//    var queue:[Int] = []
//    var CheckPoint = false
//
//    for _ in 0..<ve[1] {
//        var nodes = readLine()!.components(separatedBy: " ").map({Int($0)!})
//        graph[nodes[0]].append(nodes[1])
//    }
//
//    for i in 1...ve[0] {
//        if !visited[i].0 {
//            queue.append(i)
//            visited[i].0 = true
//            visited[i].1 = 1
//            while !queue.isEmpty {
//                var x = queue.removeFirst()
//                for j in graph[x] {
//                    if !visited[j].0 {
//                        queue.append(j)
//                        visited[j].0 = true
//                        visited[j].1 = visited[x].1 == 1? 2:1
//                    } else {
//                        if visited[j].1 == visited[x].1 {
//                            CheckPoint = true
//                            break
//                        }
//                    }
//
//                }
//            }
//        }
//    }
//
////        if !visited[i].0 {
////            queue.append(i)
////            visited[i].0 = true
////            visited[i].1 = 1
////            while !queue.isEmpty {
////                var x = queue.removeFirst()
////                for i in graph[x] {
////                    if !visited[i as! Int].0 {
////                        visited[i as! Int].0 = true
////                        visited[i as! Int].1 = visited[x].1 % 2 == 0 ? 1:0
////                        queue.append(i as! Int)
////                    } else {
////                        if visited[i as! Int].1 == visited[x].1 {
////                            CheckPoint = true
////                            break
////                        }
////                    }
////                }
////                if CheckPoint { break }
////            }
////        }
////        if CheckPoint {break}
////    }
////
////    CheckPoint ? print("NO") : print("YES")

import Foundation

var p = 1
while true {
    if p == 1 {
        break
    } else {
        if p==1 {break}
    }
}
print("1")
