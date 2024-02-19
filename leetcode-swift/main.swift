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
    /// 计算接雨水的总量
    ///
    /// 给定一个整数数组 `height`，其中每个元素代表一个条形块的高度，计算在完全下雨后，能够接多少雨水。
    /// 实现思路基于动态编程，分别计算每个位置左侧和右侧的最大高度，然后根据每个位置的左右最大高度和当前高度差计算能接的雨水量。
    ///
    /// - Parameter height: 一个整数数组，表示每个条形块的高度。
    /// - Returns: 返回能接的雨水总量
    func trap(_ height: [Int]) -> Int {
        let n = height.count
        if n <= 1 {
            return 0
        }

        // leftMax[i] 表示位置 i 左侧的最大高度，包括 i 本身
        var leftMax = height
        for i in 1..<n {
            leftMax[i] = max(height[i], leftMax[i - 1])
        }

        // rightMax[i] 表示位置 i 右侧的最大高度，包括 i 本身
        var rightMax = height
        for i in stride(from: n - 2, through: 0, by: -1) {
            rightMax[i] = max(height[i], rightMax[i + 1])
        }

        // 计算能接的雨水总量
        var sum = 0
        for i in 0..<n {
            // 对于每个位置，能接的雨水量等于它的左侧和右侧最大高度中较小的一个减去当前高度
            sum += min(leftMax[i], rightMax[i]) - height[i]
        }

        return sum
    }
}
