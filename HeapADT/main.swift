/* Main usage / Example
 
 Given an array, create a heap, then print the heap
 
 */

// have array
let arr = [10, 81, 70, 34, 52, 93, 31, 20, 42, 32, 42, 23, 74, 28, 67, 61, 55, 65, 45, 80, 49, 98, 43, 6, 93, 12, 30, 18, 75, 51, 36, 42, 61, 98, 97, 19, 37, 78, 70, 56, 55, 20, 54, 6, 49, 7, 17, 10, 64, 1, 91, 56, 49, 69, 58, 30, 55, 84, 49, 38, 86, 66, 37, 17, 77, 6, 100, 19, 94, 27, 58, 67, 6, 36, 77, 81, 100, 85, 74, 39, 6, 87, 49, 26, 13, 62, 83, 23, 46, 76, 18, 90, 72, 72, 6, 43, 52, 69, 22, 23]

// create heaps & test

// let maxHeap = MaxHeap([9, 8, 5, 4, 10, 2], maxSize: 50)
let maxHeap = MaxHeap(arr, maxSize: 100)
print(maxHeap.treeDescription)

// does it fulfill the heap property?
let nodes = maxHeap.elements.compactMap { $0 } // remove all leaves & empty nodes
print("MaxHeap is a heap: \(BinaryHeap.isHeap(nodes))")
