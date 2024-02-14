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
    /// 查找排序数组中指定元素的首尾位置
    ///
    /// - Parameters:
    ///   - nums: 排序好的整数数组
    ///   - target: 需要查找的目标值
    /// - Returns: 返回一个包含目标值首次出现和最后一次出现的索引位置的数组。如果目标值在数组中不存在，则返回 [-1, -1]。
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        return [binarySearch(nums, target, true), binarySearch(nums, target, false)]
    }

    /// 在排序数组中执行二分查找，以找到目标值的索引位置。
    ///
    /// - Parameters:
    ///   - nums: 排序好的整数数组
    ///   - target: 需要查找的目标值
    ///   - lower: 布尔值，指示查找目标值的首次出现（true）还是最后一次出现（false）。
    /// - Returns: 如果找到目标值，则返回其索引位置；否则返回 -1。
    private func binarySearch(_ nums: [Int], _ target: Int, _ lower: Bool) -> Int {
        var res = -1
        var lo = 0
        var hi = nums.count - 1
        while lo <= hi {
            let mid = lo + (hi - lo) / 2
            if target < nums[mid] {
                hi = mid - 1
            } else if nums[mid] < target {
                lo = mid + 1
            } else {
                res = mid
                if lower {
                    hi = mid - 1
                } else {
                    lo = mid + 1
                }
            }
        }
        return res
    }
}
