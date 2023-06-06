import Foundation

func Permutation<T: Comparable>(_ array:[T], _ n:Int) -> [[T]] {
    var result:[[T]] = []
    if array.count < n { return result }
    var visited = Array(repeating: false, count: array.count)
    
    func cycle(_ now:[T]) {
        if now.count == n {
            result.append(now)
            return
        }
        
        for i in 0..<array.count {
            if visited[i] {
                continue
            } else {
                visited[i] = true
                cycle(now + [array[i]])
                visited[i] = false
            }
            // 처음봣을 때 true로 선언 후 false로 다시 저장하는게 이해가 안 됐다.
            // 익숙해지도록 노력해보자
        }
    }
}

func Combination<T: Comparable>(_ array:[T], _ n:Int) -> [[T]]{
    var result:[[T]] = []
    if array.count < n { return result }
    var visited = Array(repeating:false, count:array.count)
    
    func cycle(_ idx:Int, _ now:[T]) {
        if now.count == n {
            result.append(now)
            return
        }
        
        for i in idx..<array.count {
            cycle(i+1, now + [array[i]])
        }
    }
    
}


// 백트래킹 알고리즘을 사용하기 때문에, 조건이 안 맞을때 백트랙을 하기 위해
// 탈출가능한 내부함수를 따로 선언해준다.
// Combination과 Permutation의 큰 차이는 첫 완전탐색시 처음부터 탐색하는지, 직전보다 큰 값을 보는지.
// Permutation과 combination 만드는 연습. 백트래킹 + 재귀
// 코딩테스트에 자주 나오므로 연습 필수!!!!!

// 초안은 class로 만드려 했지만, 함수로 만드는게 더 적합하다고 판단.
//class Combination {
//    var input:[Any] = []
//    var result:[Any] = []
//
//    init(_ arr:[Any]) {
//        self.input = arr
//    }
//
//    func combi(_ idx:Int, _ r:Int, _ tmp:[Any]) {
//        if r == tmp.count {
//            result.append(tmp)
//            return
//        }
//
//        for i in idx..<input.count {
//            combi(i+1, r, tmp + [input[i]])
//        }
//    }
//
//    func clear() {
//        result.removeAll()
//    }
//}
