//
//  Fib.swift
//  算法
//
//  Created by 许江飞 on 2020/12/21.
//

import Foundation

class Fib: NSObject {
    func Fib(_ num: Int) -> Int {
        // 声明一个字典，存放数据
//        var memo = [Int: Int]()
//        return dp_one(10, &memo)
//        return dp_two(10, &memo)
        return dp_three(10)
    }
    
    
    /// 构建DP表
    /// - Parameters:
    ///   - num: 待处理数字
    ///   - memo: 记录表
    /// - Returns: 结果值
    func dp_one(_ num: Int, _ memo: inout [Int: Int]) -> Int {
        if num == 0 {
            return 0;
        }
        if num == 1 || num == 2 {
            return 1;
        }
        if memo[num] != nil {
            return memo[num]!
        }
        memo[num] = dp_one(num - 1, &memo) + dp_one(num - 2, &memo)
        return memo[num]!
    }
    
    
    func dp_two(_ num: Int, _ memo: inout [Int: Int]) -> Int {
        if num == 0 {
            return 0;
        }
        if num == 1 || num == 2 {
            return 1;
        }
        for index in 3...num {
            memo[index] = dp_two(index - 1, &memo) + dp_two(index - 2, &memo)
        }
        return memo[num]!
    }
    
    
    func dp_three(_ num: Int) -> Int {
        if num == 0 {
            return 0;
        }
        if num == 1 || num == 2 {
            return 1;
        }
        var pre = 1
        var current = 1
        for _ in 3...num {
            let sum = pre + current
            pre = current
            current = sum
        }
        return current
    }
    
    
}
