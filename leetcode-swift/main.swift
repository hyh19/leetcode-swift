public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    /// 将数组中所有的 0 移动到数组的末尾，同时保持非零元素的相对顺序。
    ///
    /// - Parameter nums: 一个引用传递的整型数组，可能包含 0 和非零整数。
    func moveZeroes(_ nums: inout [Int]) {
        // [0..i-1] != 0
        // [i..j-1] == 0
        // [j..n-1] Scanning
        var i = 0
        var j = 0
        let n = nums.count
        while j < n {
            while j < n, nums[j] == 0 {
                j += 1
            }
            if j < n {
                nums.swapAt(i, j)
                i += 1
                j += 1
            }
        }
    }
}
