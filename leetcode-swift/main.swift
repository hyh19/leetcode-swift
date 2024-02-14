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
    /// 在一个升序排列的整型数组中执行二分查找
    ///
    /// - Parameters:
    ///   - nums: 一个升序排列的整型数组
    ///   - target: 需要查找的目标值
    /// - Returns: 如果目标值存在于数组中，则返回其索引；否则返回 -1。
    func search(_ nums: [Int], _ target: Int) -> Int {
        var lo = 0
        var hi = nums.count - 1
        while lo <= hi {
            let mid = lo + (hi - lo) / 2
            if target < nums[mid] {
                hi = mid - 1
            } else if nums[mid] < target {
                lo = mid + 1
            } else {
                return mid
            }
        }
        return -1
    }
}
