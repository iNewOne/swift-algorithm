//
//  main.swift
//  算法
//
//  Created by 许江飞 on 2020/12/18.
//

import Foundation

class Solution {
    
    
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var hashMap = [Int:Int]()
        var result = [Int]()
        for (index, value) in nums.enumerated(){
            hashMap[value] = index
        }
        var j = -1
        for (index, value) in nums.enumerated() {
            j = hashMap[target - value] ?? -1
            if j != -1 && index != j {
                result.append(index)
                result.append(j)
                break;
            }
        }
        return result
    }
}

//let so = Solution()
//let result = so.twoSum([1,2,3,4,5,6,9], 7)
//print(result)

//let sort = Sort()
//print(sort.allSort([1,2,3]))

//let fib = Fib()
//print(fib.Fib(10))

//let coin = Coins()
//print(coin.chargeCoin_dp([1,2,5], 10))

//let queen = Queen()
//print(queen.solveQueen(n: 4))

//let dept = BinaryTreeMinDepth()
//
//var nodeA = TreeNode(1)
//var nodeB = TreeNode(2)
//var nodeC = TreeNode(3)
//var nodeD = TreeNode(4)
//var nodeE = TreeNode(5)
//
//nodeA.left = nodeB
//nodeA.right = nodeC
//nodeB.left = nodeD
//nodeB.right = nodeE
//
//print(dept.minDepth(nodeA))

//let clock = Clock()
//print(clock.BFS("1112", ["1111", "1113"]))


let w = SlideWindow()
print(w.allSubStr("cbeaebabacd", "abc"))
