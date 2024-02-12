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
    /// 将整数数组转换为能够组成的最大数的字符串表示
    ///
    /// - Parameter nums: 一个整数数组
    /// - Returns: 一个表示数组中数字能组成的最大数的字符串
    func largestNumber(_ nums: [Int]) -> String {
        var strs = nums.map { String($0) } // 将整数数组转换为字符串数组
        strs.sort(by: { $0 + $1 > $1 + $0 }) // 根据组合后的字符串大小进行排序
        let ans = strs.joined() // 将排序后的字符串数组拼接成一个单一的字符串
        return ans[ans.startIndex] == "0" ? "0" : ans // 检查结果字符串的开头是否为 “0”
    }
}
