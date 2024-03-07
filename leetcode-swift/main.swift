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
    /// 查找字符串 `s` 中包含字符串 `t` 所有字符的最小窗口子串
    ///
    /// - Parameters:
    ///   - s: 被搜索的字符串
    ///   - t: 需要在 `s` 中查找的目标字符串
    /// - Returns: `s` 中包含 `t` 的所有字符的最小窗口子串。如果不存在，则返回空字符串。
    func minWindow(_ s: String, _ t: String) -> String {
        let sChs = [Character](s) // 将字符串 `s` 转换为字符数组
        let tChs = [Character](t) // 将字符串 `t` 转换为字符数组
        
        var need: [Character: Int] = [:] // `t` 中每个字符及其出现次数的映射
        for ch in tChs {
            need[ch] = (need[ch] ?? 0) + 1
        }
        
        // s[left..right) = 窗口内的字符串
        // s[right..n-1]  = 待遍历的字符串
        var window: [Character: Int] = [:] // 当前窗口中每个字符及其出现次数的映射
        var left = 0 // 窗口的左边界
        var right = 0 // 窗口的右边界
        
        var valid = 0 // 当前窗口中满足 `need` 条件的字符种类数量
        var start = 0 // 最小窗口子串的起始索引
        var len = Int.max // 最小窗口子串的长度，初始化为最大整数，方便后续比较。
        
        // 遍历 `s` 字符串
        while right < sChs.count {
            let add = sChs[right] // 将要加入窗口的字符
            right += 1 // 右移窗口
            if need[add] != nil { // 如果该字符是 `t` 中需要的字符
                window[add] = (window[add] ?? 0) + 1 // 更新窗口内字符的计数
                if window[add] == need[add] { // 如果窗口内该字符的数量满足 `t` 的需求
                    valid += 1
                }
            }
            // 当窗口完全覆盖 `t` 时，尝试缩小窗口。
            if valid == need.count {
                while left < right {
                    let del = sChs[left] // 将要从窗口中移除的字符
                    if need[del] != nil && window[del] == need[del] { // 如果移除后将不再满足条件，则停止缩小窗口。
                        break
                    }
                    if need[del] != nil { // 如果是需要的字符，则减少窗口内的计数。
                        window[del]! -= 1
                    }
                    left += 1 // 左移窗口。
                }
                // 更新最小窗口子串的信息。
                if right - left < len {
                    start = left
                    len = right - left
                }
            }
        }
        // 返回最小窗口子串，如果未找到满足条件的子串，则返回空字符串。
        return len == Int.max ? "" : String(sChs[start ... start + len - 1])
    }
}
