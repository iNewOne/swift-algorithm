//
//  Window.swift
//  算法
//
//  Created by 许江飞 on 2020/12/25.
//

import Foundation

class SlideWindow: NSObject {
    
    /// 返回最小字串
    /// - Parameters:
    ///   - s: 待校验字符串
    ///   - t: 需要包含的字符串
    /// - Returns: 最小字串，如果没有就返回空字符串
    func minStr(_ s: String, _ t: String) -> String {
        var window = [Character: Int]()
        var needs = [Character: Int]()
        for char:Character in t {
            if needs.keys.contains(char) {
                needs[char]! += 1
            } else {
                needs[char] = 1
            }
        }
        var left = 0, right = 0, valid = 0, start = 0
        var length = Int.max
        
        while right < s.count {
            
            let rIndex = s.index(s.startIndex, offsetBy: right)
            let r_Current = s[rIndex]
            
            right += 1
            
            if needs.keys.contains(r_Current) {
                if window.keys.contains(r_Current) {
                    window[r_Current]! += 1
                } else {
                    window[r_Current] = 1
                }
                if window[r_Current] == needs[r_Current] {
                    valid += 1
                }
            }
            
            while valid == needs.count {
                // 此时已经找到符合条件的子串，开始收缩left
                if right - left < length {
                    start = left
                    length = right - left
                }
                
                let lIndex = s.index(s.startIndex, offsetBy: left)
                let l_Current = s[lIndex]
                left += 1
                if needs.keys.contains(l_Current) {
                    if window[l_Current] == needs[l_Current] {
                        valid -= 1
                    }
                    window[l_Current]! -= 1
                }
            }
        }
        let s_index = s.index(s.startIndex, offsetBy: start)
        let l_index = s.index(s_index, offsetBy: length)
        return String(length == Int.max ? "" : s[s_index..<l_index])
    }
    
    
    func subStr(_ s: String, _ t: String) -> Bool {
        var window = [Character: Int]()
        var needs = [Character: Int]()
        for char:Character in t {
            if needs.keys.contains(char) {
                needs[char]! += 1
            } else {
                needs[char] = 1
            }
        }
        var left = 0, right = 0, valid = 0
        
        while right < s.count {
            
            let rIndex = s.index(s.startIndex, offsetBy: right)
            let r_Current = s[rIndex]
            
            right += 1
            
            if needs.keys.contains(r_Current) {
                if window.keys.contains(r_Current) {
                    window[r_Current]! += 1
                } else {
                    window[r_Current] = 1
                }
                if window[r_Current] == needs[r_Current] {
                    valid += 1
                }
            }
            
            while right - left >= t.count {
                if valid == needs.count {
                    return true
                }
                // 开始收缩left
                let lIndex = s.index(s.startIndex, offsetBy: left)
                let l_Current = s[lIndex]
                left += 1
                if needs.keys.contains(l_Current) {
                    if window[l_Current] == needs[l_Current] {
                        valid -= 1
                    }
                    window[l_Current]! -= 1
                }
            }
        }
        return false
    }
    
    func allSubStr(_ s: String, _ t: String) -> [Int] {
        var window = [Character: Int]()
        var needs = [Character: Int]()
        for char:Character in t {
            if needs.keys.contains(char) {
                needs[char]! += 1
            } else {
                needs[char] = 1
            }
        }
        var allIndex = [Int]();
        var left = 0, right = 0, valid = 0
        while right < s.count {
            let rIndex = s.index(s.startIndex, offsetBy: right)
            let r_Current = s[rIndex]
            right += 1
            
            if needs.keys.contains(r_Current) {
                if window.keys.contains(r_Current) {
                    window[r_Current]! += 1
                } else {
                    window[r_Current] = 1
                }
                if window[r_Current] == needs[r_Current] {
                    valid += 1
                }
            }
            
            while right - left >= t.count {
                if valid == needs.count {
                    allIndex.append(left)
                }
                let lIndex = s.index(s.startIndex, offsetBy: left)
                let l_Current = s[lIndex]
                left += 1
                if needs.keys.contains(l_Current) {
                    if window[l_Current] == needs[l_Current] {
                        valid -= 1
                    }
                    window[l_Current]! -= 1
                }
            }
        }
        return allIndex
    }
    
    
    func findMaxSubStr(_ s: String) -> Int {
        var left = 0, right = 0, res = 0
        var window = [Character: Int]()
        
        while right < s.count {
            let rIndex = s.index(s.startIndex, offsetBy: right)
            let r_Current = s[rIndex]
            right += 1
            if window.keys.contains(r_Current) {
                window[r_Current]! += 1
            } else {
                window[r_Current] = 1
            }
            
            while window[r_Current]! > 1 {
                let lIndex = s.index(s.startIndex, offsetBy: left)
                let l_Current = s[lIndex]
                left += 1
                window[l_Current]! -= 1
            }
            res = max(res, right - left)
        }
        return res
    }
}
