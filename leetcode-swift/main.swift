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
    /// 将数组中的元素向右旋转 k 个位置。
    /// - Parameters:
    ///   - nums: 一个整型数组的引用，操作将直接在这个数组上进行。
    ///   - k: 旋转的步数，即将数组的最后 k 个元素移动到数组的前面。
    /// 数组旋转操作首先对整个数组进行反转，然后分别反转前 k 个元素和剩余的 n-k 个元素。
    func rotate(_ nums: inout [Int], _ k: Int) {
        let n = nums.count // 数组的长度
        let t = k % n // 实际旋转的步数，考虑到 k 可能大于数组长度的情况
        if t > 0 {
            reverse(&nums, 0, n - 1) // 先反转整个数组
            reverse(&nums, 0, t - 1) // 然后反转前 t 个元素
            reverse(&nums, t, n - 1) // 最后反转剩余的元素
        }
    }

    /// 将数组的一部分进行反转。
    /// - Parameters:
    ///   - nums: 一个整型数组的引用，操作将直接在这个数组上进行。
    ///   - lo: 要反转部分的起始索引。
    ///   - hi: 要反转部分的结束索引。
    /// 此方法通过交换两端的元素来反转指定部分的数组，直到中间位置。
    private func reverse(_ nums: inout [Int], _ lo: Int, _ hi: Int) {
        var i = lo, j = hi
        while i < j {
            nums.swapAt(i, j) // 交换 i 和 j 位置的元素
            i += 1 // i 向中间移动
            j -= 1 // j 向中间移动
        }
    }
}
