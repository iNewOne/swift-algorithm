//
//  coins.swift
//  算法
//
//  Created by 许江飞 on 2020/12/21.
//

import Foundation

class Coins: NSObject {
    
    var memo = [Int: Int]()
    
    func chargeCoin(_ coins: [Int], _ amount: Int) -> Int {
        
        if amount < 0 {
            return -1
        }
        if amount == 0 {
            return 0
        }
        var result = Int.max
        for coin in coins {
            let subproblem = chargeCoin(coins, amount - coin)
            // 子问题无解，跳过当前循环
            if subproblem == -1 {
                continue
            }
            result = min(result, subproblem + 1)
        }
        return result != Int.max ? result : -1;
    }
    
    func chargeCoin_One(_ coins: [Int], _ amount: Int) -> Int {
        if memo[amount] != nil {
            return memo[amount]!
        }

        if amount == 0 {
            return 0
        }
        if amount < 0 {
            return -1
        }
        var res = Int.max
        for coin in coins {
            let subproblem = chargeCoin_One(coins, amount - coin)
            if subproblem == -1 {
                continue
            }
            res = min(res, subproblem + 1)
        }
        memo[amount] = (res != Int.max ? res : -1)
        return memo[amount]!
    }
    
    
    func chargeCoin_dp(_ coins:[Int], _ amount: Int) -> Int {
        var memo = Array(repeating: amount + 1, count: amount + 1)
        memo[0] = 0
        for i in 0...amount {
            for coin in coins {
                if i - coin < 0 {
                    continue
                }
                memo[i] = min(memo[i], memo[i-coin] + 1)
            }
        }
        return (memo[amount] == amount + 1 ? -1 : memo[amount])
    }
}
