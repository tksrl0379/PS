// https://leetcode.com/explore/learn/card/linked-list/214/two-pointer-technique/1212/

// 1차 방법

class Solution {
    
    func hasCycle(_ head: ListNode?) -> Bool {
        
        var node = head
        while true {
            guard let unwrappedNode = node else {
                return false // 다음 노드가 없는 경우 false
            }
            
            if unwrappedNode.val == Int.min {
                return true
            }
            
            unwrappedNode.val = Int.min
            node = unwrappedNode.next
        }
    }
}

// 2차 방법

class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        if head == nil { return false }
        
        var slow = head
        var fast = head
        
        while fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
            
            if slow === fast {
                return true
            }
        }
        
        return false
    }
}
