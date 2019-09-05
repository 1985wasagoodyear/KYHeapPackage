//
//  MaxHeap.swift
//  HeapADT
//
//  Created by K Y on 9/4/19.
//  Copyright © 2019 K Y. All rights reserved.
//

import Foundation

class MaxHeap<T: Comparable>: Heap {
    typealias H = MaxHeap
    
    var elements: [T?]
    var size: Int
    var isEmpty: Bool {
        return size == 0
    }
    private var isFull: Bool {
        return size == maxSize
    }
    var maxSize: Int {
        return elements.count
    }
    
    init(_ size: Int) {
        elements = []
        elements.reserveCapacity(size)
        self.size = 0
        for _ in 0..<size {
            elements.append(nil)
        }
    }
    
    init(_ array: [T], maxSize: Int) {
        // TODO: what if maxSize < array's size?
        size = array.count
        elements = array
        elements.reserveCapacity(maxSize)
        for _ in array.count..<maxSize {
            elements.append(nil)
        }
        heapify()
    }
    
    func peek() -> T? {
        if let first = elements.first {
            return first
        }
        return nil
    }
    
    /*
     1. Add the element to the bottom level of the heap.
     2. Compare the added element with its parent; if they are in the correct order, stop.
     3. If not, swap the element with its parent and return to the previous step.
    */
    func insert(_ val: T) {
        if isFull { return }
        elements[size] = val
        siftUp(at: size)
        size += 1
    }
    
    /*
     1. Replace the root of the heap with the last element on the last level.
     2. Compare the new root with its children; if they are in the correct order, stop.
     3. If not, swap the element with one of its children and return to the previous step.
        (Swap with its smaller child in a min-heap and its larger child in a max-heap.)
    */
    func pop() -> T? {
        if isEmpty { return nil }
        size -= 1
        if isEmpty == false {
            elements.swapAt(0, size)
            siftDown(at: 0)
        }
        return elements[size]
    }
    
    func heapify() {
        for i in (0...size/2).reversed() {
            siftDown(at: i)
        }
    }
    
    func siftUp(at index: Int) {
        if index == 0 { return }
        let parentIndex = (index - 1) / 2
        let currVal = elements[index]!
        let parentVal = elements[parentIndex]!
        if currVal > parentVal {
            elements.swapAt(index, parentIndex)
            siftUp(at: parentIndex)
        }
        
    }

    func siftDown(at index: Int) {
        let lChildIndex = index * 2 + 1
        let rChildIndex = index * 2 + 2
        if lChildIndex >= size || rChildIndex >= size { return }
        let currVal = elements[index]!
        let lChild = elements[lChildIndex]!
        let rChild = elements[rChildIndex]!
        if lChild > currVal && rChild > currVal {
            let swapIndex = lChild > rChild ? lChildIndex : rChildIndex
            elements.swapAt(index, swapIndex)
            siftDown(at: swapIndex)
        }
        else if lChild > currVal {
            elements.swapAt(index, lChildIndex)
            siftDown(at: lChildIndex)
        }
        else if rChild > currVal {
            elements.swapAt(index, rChildIndex)
            siftDown(at: rChildIndex)
        }
    }
    
}

extension MaxHeap: CustomStringConvertible where T: CustomStringConvertible {
    var description: String {
        return "[" + elements.map { $0?.description ?? "nil" }.joined(separator: ", ") + "]"
    }
    var treeDescription: String {
        let nodes = elements.map { $0?.description ?? "nil" }
        var desc: String = ""
        var lineCount = 1
        var currCount = 0
        var printNodes: [String] = []
        for node in nodes {
            printNodes.append(node)
            currCount += 1
            if currCount == lineCount {
                lineCount *= 2
                currCount = 0
                desc.append(printNodes.joined(separator: " ") + "\n")
                printNodes.removeAll()
            }
        }
        if printNodes.isEmpty == false {
            desc.append(printNodes.joined(separator: " ") + "\n")
        }
        return desc
    }
}
