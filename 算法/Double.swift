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
}
