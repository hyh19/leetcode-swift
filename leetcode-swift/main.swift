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
    /// 计算在指定天数内送达所有包裹需要的最小运载能力
    ///
    /// 使用二分查找算法找到满足条件的最小运载能力。定义两个边界，下边界为包裹中最重的重量，上边界为所有包裹重量之和。
    /// 逐步缩小这个范围直到找到最小的符合条件的运载能力。
    ///
    /// - Parameters:
    ///   - weights: 包裹重量的数组
    ///   - days: 需要在这么多天内送达所有包裹
    /// - Returns: 返回能在指定天数内完成运送的最小运载能力
    func shipWithinDays(_ weights: [Int], _ days: Int) -> Int {
        var lo = weights.max()! // 所有包裹中的最大重量，为运载能力的最小可能值
        var hi = weights.reduce(0, +) // 所有包裹的总重量，为运载能力的最大可能值
        var ans = lo
        while lo <= hi {
            let mid = lo + (hi - lo) / 2
            if canFinish(weights, days, mid) {
                ans = mid
                hi = mid - 1
            } else {
                lo = mid + 1
            }
        }
        return ans
    }

    /// 检查给定运载能力是否能在指定天数内完成包裹运送
    ///
    /// 根据给定的运载能力和包裹重量数组，计算出在不超过运载能力的情况下，完成所有包裹运送需要的天数。
    /// 如果这个天数小于或等于给定的天数，返回 true，表示可以完成运送。
    ///
    /// - Parameters:
    ///   - weights: 包裹重量的数组
    ///   - days: 目标天数
    ///   - capacity: 给定的运载能力
    /// - Returns: 如果能在指定天数内完成运送，返回 true；否则返回 false。
    private func canFinish(_ weights: [Int], _ days: Int, _ capacity: Int) -> Bool {
        var minDays = 0 // 完成运送需要的最小天数
        var i = 0 // 当前考察的包裹索引
        let n = weights.count
        while i < n {
            var sum = 0 // 当前船上包裹的总重量
            while i < n && sum + weights[i] <= capacity { // 当前船的总重量不超过给定的运载能力
                sum += weights[i]
                i += 1
            }
            minDays += 1 // 完成一天的运送
        }
        return minDays <= days // 如果需要的天数不超过给定的天数，返回 true
    }
}
