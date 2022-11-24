import Foundation

class Combination {
    var input:[Any] = []
    var result:[Any] = []
    
    init(_ arr:[Any]) {
        self.input = arr
    }
    
    func combi(_ idx:Int, _ r:Int, _ tmp:[Any]) {
        if r == tmp.count {
            result.append(tmp)
            return
        }
        
        for i in idx..<input.count {
            combi(i+1, r, tmp + [input[i]])
        }
    }
    
    func clear() {
        result.removeAll()
    }
}

let example = Combination([1,2,3,4,5])
example.combi(0, 3, [])
print(example.result)

// combination 만드는 연습. 코딩테스트에 자주 나오므로 연습 필수!
