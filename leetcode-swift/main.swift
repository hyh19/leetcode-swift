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
    /// 在旋转排序数组中搜索一个给定的目标值
    ///
    /// - Parameters:
    ///   - nums: 旋转排序的数组
    ///   - target: 要搜索的目标值
    /// - Returns: 目标值在数组中的索引；如果不存在，则返回 `-1`。
    func search(_ nums: [Int], _ target: Int) -> Int {
        var lo = 0
        var hi = nums.count - 1
        while lo <= hi {
            let mid = lo + (hi - lo) / 2
            if nums[mid] == target {
                return mid
            }
            // 当 lo = hi 时，nums[lo] = nums[mid] = nums[hi]，
            // 此时 nums[mid] < target <= nums[hi] 不成立
            if nums[mid] <= nums[hi] {
                if nums[mid] < target && target <= nums[hi] {
                    lo = mid + 1
                } else {
                    hi = mid - 1
                }
            } else {
                if nums[lo] <= target && target < nums[mid] {
                    hi = mid - 1
                } else {
                    lo = mid + 1
                }
            }
        }
        return -1
    }
}
