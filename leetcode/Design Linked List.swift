// https://leetcode.com/explore/learn/card/linked-list/209/singly-linked-list/1290/

// 연결 리스트

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
    
    func get(_ index: Int) -> Int { 
        guard let node = node(at: index) else {
            return -1
        }
        return node.val
    }
    
    func addAtHead(_ val: Int) {
        head = Node(val: val, next: head)
    }
    
    func addAtTail(_ val: Int) {
        if head == nil { 
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
    
    private func node(at index: Int) -> Node? {
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

// 이중 연결 리스트
// 찾으려는 index의 size에 따라 head or tail을 선택하여 탐색할 수 있어 단일 연결리스트보다 leetcode 수치 상 2배 더 빠르게 나옴
// 단점은 코드가 다소 너저분해지고 메모리를 조금씩 더 차지함

class MyLinkedList {

    class Node {
        var val: Int
        var prev: Node?
        var next: Node?
        
        init(val: Int, prev: Node? = nil, next: Node? = nil) {
            self.val = val
            self.prev = prev
            self.next = next
        }
    }
    
    private var head: Node = Node(val: -100)
    private var tail: Node = Node(val: -100)
    private var size: Int = 0
    
    init() {
        head.next = tail
        tail.prev = head
    }
    
    func get(_ index: Int) -> Int {
        guard let node = node(at: index) else {
            return -1
        }
        return node.val
    }
    
    func addAtHead(_ val: Int) {
        if head.next === tail { // 공백인 경우
            let newNode = Node(val: val, prev: head, next: tail)
            head.next = newNode
            tail.prev = newNode
        } else {
            let newNode = Node(val: val, prev: head, next: head.next)
            head.next?.prev = newNode
            head.next = newNode
        }
        size += 1
    }
    
    func addAtTail(_ val: Int) {
        if head.next === tail { // 공백인 경우
            let newNode = Node(val: val, prev: head, next: tail)
            head.next = newNode
            tail.prev = newNode
        } else {
            let newNode = Node(val: val, prev: tail.prev, next: tail)
            tail.prev?.next = newNode
            tail.prev = newNode
        }
        size += 1
    }
    
    func addAtIndex(_ index: Int, _ val: Int) { 
        if index == 0 {
            addAtHead(val)
        } else {
            guard let prevNode = node(at: index - 1) else {
                return
            }
            
            let newNode = Node(val: val, prev: prevNode, next: prevNode.next)
            prevNode.next = newNode
            newNode.next?.prev = newNode
            
            size += 1
        }
    }
    
    func deleteAtIndex(_ index: Int) {
        guard let deleted = node(at: index) else {
            return
        }
        
        let prevNode = deleted.prev
        prevNode?.next = deleted.next
        prevNode?.next?.prev = prevNode
        
        size -= 1
    }
    
    private func node(at index: Int) -> Node? {
        guard index >= 0 else {
            return nil
        }
        
        if index < size/2 {
            var node = head.next
            for count in 0...index {
                if count == index && node !== tail {
                    return node
                }
                
                if node === tail {
                    return nil
                }
                
                node = node?.next
            }
            return node
        } else {
            var node = tail.prev
            for count in 0...index {
                if count == (size - index - 1) && node !== head {
                    return node
                }
                
                if node === head {
                    return nil
                }
                
                node = node?.prev
            }
            return node
        }
    }
}
