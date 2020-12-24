//
//  Queue.swift
//  算法
//
//  Created by 许江飞 on 2020/12/22.
//

import Foundation

class Queen: NSObject {
    var res = [[String]]()
    func solveQueen(n: Int) -> [[String]] {
        let string = String(repeating: "E", count: n)
        var board = Array(repeating: string, count: n)
        backtrack(&board, row: 0)
        return res
    }
    
    func backtrack(_ board: inout [String], row: Int) {
        if row == board.count {
            res.append(board)
            return
        }
        // 当前第row行的列数
        let n = board[row].count
        for col in 0..<n {
            if !isValid(&board, row: row, col: col) {
                continue
            }
            let str: String = board[row]
            let startIndex = str.index(str.startIndex, offsetBy: col)
            let endIndex = str.index(after: startIndex)
            board[row] = str.replacingCharacters(in: startIndex..<endIndex, with: "Q")
            backtrack(&board, row: row + 1);
            board[row] = str.replacingCharacters(in: startIndex..<endIndex, with: "E")
        }
    }
    
    func isValid(_ board: inout [String], row: Int, col: Int) -> Bool {
        let n = board[row].count
//        判断当前列是否有皇后
        for i in 0..<row {
            let str: String = board[i]
            let startIndex = str.index(str.startIndex, offsetBy: col)
            if str[startIndex] == "Q" {
                return false
            }
        }
        
//        判断右上方是否有皇后
        var i = row - 1
        var j = col + 1
        while (i >= 0 && j < n) {
            let str: String = board[i]
            let startIndex = str.index(str.startIndex, offsetBy: j)
            i-=1
            j+=1
            if str[startIndex] == "Q" {
                return false
            }
        }
        
//        判断左上方是否有皇后
        i = row - 1
        j = col - 1
        while (i >= 0 && j >= 0) {
            let str: String = board[i]
            let startIndex = str.index(str.startIndex, offsetBy: j)
            i-=1
            j-=1
            if str[startIndex] == "Q" {
                return false
            }
        }
        
        return true
    }
}
