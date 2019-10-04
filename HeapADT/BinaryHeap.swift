/*
 a heap is not a sorted structure; it can be regarded as being partially ordered.
 
 A heap is a useful data structure when it is necessary to repeatedly remove the object with the highest (or lowest) priority.
 */

import Foundation

typealias PriortyQueue = BinaryHeap

class BinaryHeap { }

extension BinaryHeap {
    static func isHeap<T:Comparable>(_ arr: [T], start: Int = 0, end: Int = arr.count - 1) -> Bool {
        // If a leaf node
        if (start > (end - 2)/2) {
            return true
        }
        
        // If an internal node and is greater than its children, and
        // same is recursively true for the children
        let leftIndex = 2 * start + 1
        let rightIndex = 2 * start + 2
        if arr[start] >= arr[leftIndex]
            && arr[start] >= arr[rightIndex]
            && isHeap(arr, start: leftIndex, end: end)
            && isHeap(arr, start: rightIndex, end: end) {
            return true
        }
        print("violation at \(start), with children \(leftIndex) and \(rightIndex)")
        print("violation at \(start) : \(arr[start]), with children \(leftIndex) : \(arr[leftIndex]) and \(rightIndex) : \(arr[rightIndex])")
        return false
    }
}
