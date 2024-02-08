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
    private var nums: [Int] = []

    func balanceBST(_ root: TreeNode?) -> TreeNode? {
        dfs(root)
        return sortedArrayToBST(nums, 0, nums.count - 1)
    }

    // 深度优先搜索，获取中序遍历结果
    private func dfs(_ root: TreeNode?) {
        guard let root = root else { return }
        dfs(root.left)
        nums.append(root.val)
        dfs(root.right)
    }

    // 将有序子数组 nums[lo..hi] 转换为二叉搜索树
    private func sortedArrayToBST(_ nums: [Int], _ lo: Int, _ hi: Int) -> TreeNode? {
        if lo > hi {
            return nil
        }
        let mid = lo + (hi - lo) / 2
        let root = TreeNode(nums[mid])
        root.left = sortedArrayToBST(nums, lo, mid - 1)
        root.right = sortedArrayToBST(nums, mid + 1, hi)
        return root
    }
}

// https://leetcode.cn/submissions/detail/384968609/
