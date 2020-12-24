//
//  List.swift
//  算法
//
//  Created by 许江飞 on 2020/12/23.
//

import Foundation

class ListNode {
    var val: Int
    var next: ListNode?
    
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class List {
    var head: ListNode?
    var tail: ListNode?
    
    // 尾插法
    func appendToTail(_ val: Int) {
        if tail == nil {
            tail = ListNode(val)
            head = tail
        } else {
            tail!.next = ListNode(val)
            tail = tail!.next
        }
    }
    
    // 头插法
    func appendToHead(_ val: Int) {
        if head == nil {
            head = ListNode(val)
            tail = head
        } else {
            let temp = ListNode(val)
            temp.next = head
            head = temp
        }
    }
}

class TreeNode {
    var left: TreeNode?
    var right: TreeNode?
    var value: Int
    
    init(_ value: Int) {
        self.value = value;
        self.left = nil;
        self.right = nil;
    }
}
