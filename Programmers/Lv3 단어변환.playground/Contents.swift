import Foundation

// 최단거리 문제이므로 DFS보다 BFS가 더 효율적이라 판단.

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    var result = 10000
    var queue:[String] = []
    var visited:[String:Int] = [:]
    var graph: [String: [String]] = [:]

    // 그래프 생성
    for i in 0..<words.count {
        visited[words[i]] = 0
        var node = words[i]
        var temparr:[String] = []
        for j in 0..<words.count {
            if Check(word: node, origin: words[j]) { temparr.append(words[j]) }
            graph[node] = temparr
        }
    }

    // bfs 실행
    for word in words {
        if Check(word: begin, origin: word) {
            queue = []
            queue.append(word)
            visited[word] = 1
            if word == target {return 1}
            while !queue.isEmpty {
                var node = queue.removeFirst()
                if node == target {
                    if visited[target]! < result {
                        result = visited[target]!
                        break
                    }
                }
                for nd in graph[node]! {
                    if visited[nd] == 0 {
                        visited[nd] = visited[node]! + 1
                        queue.append(nd)
                    }
                }
            }
        }
    }
    
    if result == 10000 {return 0}
    else {return result}

}

// 알파벳 한개만 서로 다른지 확인
func Check(word:String, origin:String) -> Bool {
    var arr1 = Array(word)
    var arr2 = Array(origin)
    var cnt = 0
    for i in 0..<word.count {
        if arr1[i] != arr2[i] {cnt += 1}
    }
    if cnt == 1 {return true}
    else {return false}
}

// 오랜시간이 걸림. 문제는 Check 함수를 word.contains()로 풀면 안되는거였다.
// 알파벳 한개씩 같은위치끼리 비교해야하는데 contains는 중복된 문자가 있을때는
// 그러한 기능을 하지 못했기 때문.
