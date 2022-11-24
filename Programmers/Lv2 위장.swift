import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var dict:[String:Int] = [:]
    for cloth in clothes {
        if dict[cloth[1]] != nil { dict[cloth[1]]! += 1 }
        else { dict[cloth[1]] = 1 }
    }

    let cnt = dict.values
    var result = 1
    for num in cnt {
        result *= num+1
    }
    
    return result-1
}

// combination으로 푸는 문제인줄 알았다. 많은 시간을 잡아먹었는데,
// 간단한 해결책이였다. 각 종류의 개수 + 1(안입는 경우)를 모두 곱한 다음,
// 전체에서 -1을 해주면 된다. (전부 안입는 경우를 빼줌)
// 허무한데, 경우의 수를 나열하고 곰곰히 생각해야하는걸까.. 좀 대처법이 필요하다
