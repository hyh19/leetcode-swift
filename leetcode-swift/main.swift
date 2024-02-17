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
    /// 计算 Koko 吃完所有香蕉的最小速度
    ///
    /// - Parameters:
    ///   - piles: 一个整数数组，每个元素代表一堆香蕉的数量。
    ///   - h: 一个整数，表示总时间限制，单位为小时。
    /// - Returns: 返回 Koko 吃完所有香蕉的最小速度
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        var lo = 1
        var hi = piles.max()!
        var ans = lo
        while lo <= hi {
            let mid = lo + (hi - lo) / 2
            if canFinish(piles, h, mid) {
                ans = mid
                hi = mid - 1
            } else {
                lo = mid + 1
            }
        }
        return ans
    }

    /// 判断给定速度 k 下，是否能在 h 小时内吃完所有香蕉。
    ///
    /// - Parameters:
    ///   - piles: 一个整数数组，每个元素代表一堆香蕉的数量。
    ///   - h: 一个整数，表示总时间限制，单位为小时。
    ///   - k: 一个整数，表示 Koko 每小时吃香蕉的速度。
    /// - Returns: 如果能在 h 小时内吃完返回 `true`，否则返回 `false`。
    private func canFinish(_ piles: [Int], _ h: Int, _ k: Int) -> Bool {
        var hours = 0
        for p in piles {
            hours += (p - 1) / k + 1
        }
        return hours <= h
    }
}
