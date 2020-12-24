//
//  sort.swift
//  算法
//
//  Created by 许江飞 on 2020/12/21.
//

import Foundation

class Sort: NSObject {
    
    var res = [[Int]]()
    
    func allSort(_ nums: [Int]) -> [[Int]] {
        var track = [Int]()
        backtrack(nums, track: &track)
        return res
    }
    
    func backtrack(_ nums:[Int], track: inout [Int]) {
        if track.count == nums.count {
            res.append(track)
            return;
        }
        for num in nums {
            if track.contains(num) {
                continue
            }
            track.append(num)
            backtrack(nums, track: &track)
            track.removeLast()
        }
    }
}
