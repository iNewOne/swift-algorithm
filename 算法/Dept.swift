//
//  Dept.swift
//  算法
//
//  Created by 许江飞 on 2020/12/23.
//

import Foundation

class BinaryTreeMinDepth: NSObject {
    func minDepth(_ root: TreeNode) -> Int {
        var q = Queue<TreeNode>()
        q.enqueue(root)
        var dept = 1
        
        while !q.isEmpty {
            let sz: Int = q.count
            for _ in 0..<sz {
                let cur: TreeNode = q.dequeue()!
                if cur.left == nil && cur.right == nil {
                    return dept
                }
                if cur.left != nil {
                    q.enqueue(cur.left!)
                }
                if cur.right != nil {
                    q.enqueue(cur.right!)
                }
            }
            dept+=1
        }
        return dept
    }
}

class Clock: NSObject {
    
    /// 将s[j]向上拨动
    /// - Parameters:
    ///   - s: 待更改字符串
    ///   - j: 待更改的位置
    /// - Returns: 更改后的字符串
    func pushOne(_ s: String, j: Int) -> String {
        var chars:[Character] = Array(s)
        var intJ:Int = Int(String(chars[j]))!
        if intJ == 9 {
            intJ = 0
        } else {
            intJ += 1
        }
        chars[j] = Character(String(intJ))
        return String(chars)
    }
    
    func minusOne(_ s: String, j: Int) -> String {
        var chars:[Character] = Array(s)
        var intJ:Int = Int(String(chars[j]))!
        if intJ == 0 {
            intJ = 9
        } else {
            intJ -= 1
        }
        chars[j] = Character(String(intJ))
        return String(chars)
    }
    
    func BFS(_ target:String, _ deadends: [String]) -> Int {
        
        var deadSets = Set(deadends)
        var visitedSets = Set<String>()
        var q = Queue<String>()
        q.enqueue("0000")
        visitedSets.insert("0000")
        
        var count = 0
        
        while !q.isEmpty {
            let sz = q.count
            for _ in 0..<sz {
                let str: String = q.dequeue()!
                if deadSets.contains(str) {
                    continue
                }
                if str == target {
                    return count
                }
                
                for i in 0..<4 {
                    let up = pushOne(str, j: i)
                    let down = minusOne(str, j: i)
                    if !visitedSets.contains(up) {
                        q.enqueue(up)
                        visitedSets.insert(up)
                    }
                    if !visitedSets.contains(down) {
                        q.enqueue(down)
                        visitedSets.insert(down)
                    }
                }
                
            }
            count += 1
        }
        return -1
    }
}
