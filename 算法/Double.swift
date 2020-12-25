//
//  Double.swift
//  算法
//
//  Created by 许江飞 on 2020/12/24.
//

import Foundation

class DoublePointers: NSObject {
    func hasCycle(_ head: ListNode?) -> Bool {
        var fast = head
        var slow = head
        
        while fast != nil && fast!.next != nil {
            slow = slow!.next
            fast = fast!.next!.next
            if slow === fast {
                return true
            }
        }
        return false
    }
    
    func findCyclePoint(_ head:ListNode?) -> ListNode? {
        var fast = head
        var slow = head
        
        while fast != nil && fast!.next != nil {
            slow = slow!.next
            fast = fast!.next!.next
            if slow === fast {
                break
            }
        }
        
        slow = head
        while slow! !== head {
            slow = slow!.next
            fast = fast!.next
        }
        return slow!
    }
    
    func lastKNode(_ head: ListNode?, _ k: inout Int) -> ListNode {
        var fast = head
        var slow = head
        
        while k > 0 {
            fast = fast!.next
            k-=1
        }
        
        while fast != nil {
            fast = fast!.next
            slow = slow!.next
        }
        return slow!
    }
    
    func twoSum(_ sortNums:[Int], _ target: Int) -> [Int] {
        var left = 0;
        var right = sortNums.count - 1
        while left < right {
            let sum = sortNums[left] + sortNums[right]
            if sum == target {
                return [left + 1, right + 1]
            }
            if sum < target {
                left += 1
            }
            if sum > target {
                right -= 1
            }
        }
        return [-1, -1]
    }
}
