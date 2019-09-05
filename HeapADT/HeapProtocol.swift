public protocol Heap {
    associatedtype T: Comparable
    associatedtype H: Heap
    
    /// returns max/min item of a max/min-heap.
    /// O(1)
    func peek() -> T?
    
    /// inserts an item into the heap
    /// O(logN)
    /// for binaryHeap, worst case is logN, average is constant
    func insert(_ val: T)
    
    /// removes and returns max/min item of a max/min-heap
    /// O(logN?)
    @discardableResult
    func pop() -> T?
    
    /// pop root, push a new key
    /// more efficient as it balances once
    /// O(logN)
    
    /// internal function
    /// makes a heap from an array
    func heapify()
    
    /// makes a heap by merging two heaps
    static func merge(_ heap1: H, with heap2: H) -> H
    
    /// returns number of items in the heap
    var size: Int { get }
    
    /// returns T if heap is empty, false otherwise
    var isEmpty: Bool { get }
    
    /// removes a node of that key and returns it
    func delete(_ val: T) -> T?
    
    /// moves a tree up the tree, restores heap property
    func siftUp(at index: Int)
    
    /// moves a node down the three, restores heap property
    func siftDown(at index: Int)
    
    
    
}

extension Heap {
    func replace(_ val: T) {
        fatalError("not implemented")
    }
    
    static func merge(_ heap1: H, with heap2: H) -> H {
        fatalError("not implemented")
    }
    
    func delete(_ val: T) -> T? {
        fatalError("not implemented")
    }

}
