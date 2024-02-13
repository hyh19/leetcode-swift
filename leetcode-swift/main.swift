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
    /// 对给定的数组进行排序
    ///
    /// 首先将输入数组随机打乱，以避免最坏情况的发生，然后调用私有的 `sort` 方法对打乱后的数组进行实际的排序操作。
    ///
    /// - Parameter nums: 需要排序的整数数组
    /// - Returns: 排序后的整数数组
    func sortArray(_ nums: [Int]) -> [Int] {
        var shuffled = nums.shuffled()
        sort(&shuffled, 0, shuffled.count - 1)
        return shuffled
    }

    /// 使用快速排序算法递归地对数组的指定部分进行排序
    ///
    /// - Parameters:
    ///   - nums: 需要排序的整数数组，传入时使用 `inout` 关键字允许在函数内修改数组。
    ///   - lo: 数组中需要排序部分的起始索引
    ///   - hi: 数组中需要排序部分的结束索引
    private func sort(_ nums: inout [Int], _ lo: Int, _ hi: Int) {
        if lo >= hi {
            return
        }
        let j = partition(&nums, lo, hi)
        sort(&nums, lo, j - 1)
        sort(&nums, j + 1, hi)
    }

    /// 对数组的指定部分进行划分，选择一个划分元素，然后将所有小于划分元素的值移动到其左侧，将所有大于划分元素的值移动到其右侧。
    ///
    /// - Parameters:
    ///   - nums: 需要排序的整数数组，传入时使用 `inout` 关键字允许在函数内修改数组。
    ///   - lo: 数组中需要进行划分操作部分的起始索引
    ///   - hi: 数组中需要进行划分操作部分的结束索引
    /// - Returns: 划分操作完成后，划分元素的索引位置。
    private func partition(_ nums: inout [Int], _ lo: Int, _ hi: Int) -> Int {
        let v = nums[lo]
        var i = lo, j = hi + 1
        while true {
            i += 1
            while nums[i] < v {
                if i == hi {
                    break
                }
                i += 1
            }
            j -= 1
            while v < nums[j] {
                if j == lo {
                    break
                }
                j -= 1
            }
            if i >= j {
                break
            }
            nums.swapAt(i, j)
        }
        nums.swapAt(lo, j)
        return j
    }
}
