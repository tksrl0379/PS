// https://leetcode.com/problems/merge-two-sorted-lists/

class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let head = ListNode()
        var pointer: ListNode? = head
        var l1: ListNode? = l1, l2: ListNode? = l2
        
        while true {
            guard let unwrappedL1 = l1 else {
                pointer?.next = l2
                return head.next
            }
            
            guard let unwrappedL2 = l2 else {
                pointer?.next = l1
                return head.next
            }
            
            if unwrappedL1.val > unwrappedL2.val {
                let node = ListNode(unwrappedL2.val)
                pointer?.next = node
                l2 = l2?.next
            } else {
                let node = ListNode(unwrappedL1.val)
                pointer?.next = node
                l1 = l1?.next
            }
            pointer = pointer?.next
        }
    }
}
