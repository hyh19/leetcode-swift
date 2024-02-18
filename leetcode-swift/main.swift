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
    /// 移除数组中所有指定的元素，并返回移除后数组的新长度。
    ///
    /// - Parameters:
    ///   - nums: 一个整数数组的引用，操作将直接在此数组上进行，其中的特定值 `val` 将被移除。此参数为输入输出参数。
    ///   - val: 需要从数组 `nums` 中移除的值
    /// - Returns: 移除指定元素后的数组的新长度
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        // nums[0..i-1]   != val
        // nums[i..j]     Scanning
        // nums[j+1..n-1] == val
        var i = 0
        var j = nums.count - 1
        while i <= j {
            while i <= j && nums[i] != val {
                i += 1
            }
            while i <= j && nums[j] == val {
                j -= 1
            }
            if i <= j {
                nums.swapAt(i, j)
            }
        }
        return i
    }
}
