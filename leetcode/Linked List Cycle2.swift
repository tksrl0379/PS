// https://leetcode.com/explore/learn/card/linked-list/214/two-pointer-technique/1214/

// 1차: 객체 내의 상태를 바꾸는 방식인데 이 것부터 좀 문제가 있고.. Int.min이라는 숫자가 다소 모호하다.
// 여러모로 다소 꼼수의 느낌이 있긴 하다.

class Solution {
    func detectCycle(_ head: ListNode?) -> ListNode? {
        var node = head
        while true {
            guard let unwrappedNode = node else {
                return nil // 다음 노드가 없는 경우 false
            }
            
            if unwrappedNode.val == Int.min {
                return unwrappedNode
            }
            
            unwrappedNode.val = Int.min
            node = unwrappedNode.next
        }
    }
}

// 2차: 1차 방식으로 푼 다음 다른 사람들의 답안을 보니 대부분 이런 식으로 풀은 것을 확인했다.
// slow는 1칸씩, fast는 2칸씩 움직여 결국 slow와 fast가 만나게 되는 원리를 이용한 방식이다. 
// 개인적으로 이 방법이 문제의 의도에 더 맞는 것 같다.

class Solution {
    func detectCycle(_ head: ListNode?) -> ListNode? {
        var slowNode = head
        var fastNode = head
        while fastNode != nil {
            slowNode = slowNode?.next
            fastNode = fastNode!.next?.next

            if slowNode === fastNode {
                slowNode = head
                while slowNode !== fastNode {
                    slowNode = slowNode?.next
                    fastNode = fastNode?.next
                }
                return slowNode
            }
        }

        return nil
    }
}
