class MyLinkedList {

    class Node {
        var val: Int
        var next: Node?
        
        init(val: Int, next: Node?) {
            self.val = val
            self.next = next
        }
    }
    
    private var head: Node?
    
    func get(_ index: Int) -> Int { // invalid 시 return -1
        guard let node = node(at: index) else {
            return -1
        }
        return node.val
    }
    
    func addAtHead(_ val: Int) {
        head = Node(val: val, next: head)
    }
    
    func addAtTail(_ val: Int) {
        if head == nil { // 공백에 삽입
            head = Node(val: val, next: nil)
        } else {
            var lastNode = head
            while lastNode?.next != nil {
                lastNode = lastNode?.next
            }
            
            lastNode?.next = Node(val: val, next: nil)
        }
    }
    
    func addAtIndex(_ index: Int, _ val: Int) {
        if index == 0 {
            addAtHead(val)
        } else {
            guard let prevNode = node(at: index - 1) else {
                return
            }
            let newNode = Node(val: val, next: prevNode.next)
            prevNode.next = newNode
        }
    }
    
    func deleteAtIndex(_ index: Int) {
        if index == 0 {
            let deleted = head
            head = deleted?.next
        } else {
            guard let prevNode = node(at: index - 1) else {
                return
            }
            let deleted = prevNode.next
            prevNode.next = deleted?.next
        }
    }
    
    func node(at index: Int) -> Node? {
        guard index >= 0 else {
            return nil
        }
        
        var node = head
        for count in 0...index {
            if count == index {
                return node
            }
            
            if node?.next == nil {
                return nil
            }
            
            node = node?.next
        }
        
        return node
    }
}
