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
    /// 计算并返回数组中最长连续序列的长度。
    ///
    /// 通过使用一个集合（Set）来处理数组，首先将所有元素添加到集合中去除重复项。然后遍历数组，对于每个元素，检查其前后是否有连续的数字存在，并同时从集合中移除这些连续的数字以避免重复计算。通过这种方式，可以找到以当前数字为起点的最长连续序列，并更新最长序列的长度。最终返回找到的最长序列长度。
    ///
    /// - Parameter nums: 整数数组，可能包含重复的元素。
    /// - Returns: 数组中最长连续序列的长度。如果数组为空，则返回 0。
    func longestConsecutive(_ nums: [Int]) -> Int {
        var ans = 0
        var numSet = Set(nums)
        for x in nums {
            if numSet.contains(x) {
                var lo = x - 1
                while numSet.contains(lo) {
                    numSet.remove(lo)
                    lo -= 1
                }
                var hi = x + 1
                while numSet.contains(hi) {
                    numSet.remove(hi)
                    hi += 1
                }
                ans = max(ans, hi - lo - 1)
                numSet.remove(x)
            }
        }
        return ans
    }
}
