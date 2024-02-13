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
    /// 对整数数组进行排序，使得所有 0 排在数组前面，所有 2 排在数组后面，1 排在中间。
    ///
    /// - Parameters:
    ///   - nums: 一个引用传递的整数数组，函数将直接在这个数组上进行排序操作。数组中的元素只能是 0，1 或 2。
    func sortColors(_ nums: inout [Int]) {
        let v = 1 // 用于与数组中的元素进行比较的值
        var lt = 0, gt = nums.count - 1 // `lt` 指向 0 的最右边界，`gt` 指向 2 的最左边界
        var i = 0 // 遍历数组的指针
        while i <= gt {
            if nums[i] < v { // 当前元素小于 1，应移动到数组前面
                nums.swapAt(lt, i)
                lt += 1
                i += 1
            } else if nums[i] > v { // 当前元素大于 1，应移动到数组后面
                nums.swapAt(i, gt)
                gt -= 1
            } else { // 当前元素等于 1，不需要移动
                i += 1
            }
        }
    }
}
