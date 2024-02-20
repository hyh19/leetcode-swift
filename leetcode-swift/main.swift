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
    /// 查找最长回文子串
    ///
    /// 该方法通过扩展中心的方式来查找回文串，考虑了奇数长度和偶数长度的回文串。
    ///
    /// - Parameter s: 输入的字符串
    /// - Returns: `s` 中最长的回文子串
    func longestPalindrome(_ s: String) -> String {
        let t = [Character](s)
        var ans = ""
        for i in 0..<t.count {
            // 寻找以 t[i] 为中心的最长回文子串
            let s1 = expandAroundCenter(t, i, i)
            if s1.count > ans.count {
                ans = s1
            }
            // 寻找以 t[i] 和 t[i+1] 为中心的最长回文子串
            let s2 = expandAroundCenter(t, i, i + 1)
            if s2.count > ans.count {
                ans = s2
            }
        }
        return ans
    }

    /// 返回字符串 `s` 中以 `s[i]` 和 `s[j]` 为中心的最长回文子串
    ///
    /// 该函数尝试从中心向两边扩展，以找到最长的回文子串。它可以处理奇数长度和偶数长度的回文子串。
    ///
    /// - Parameters:
    ///   - s: 字符数组，从原字符串转换得到。
    ///   - i: 回文中心的左侧索引
    ///   - j: 回文中心的右侧索引
    /// - Returns: 以 `s[i]` 和 `s[j]` 为中心的最长回文子串
    private func expandAroundCenter(_ s: [Character], _ i: Int, _ j: Int) -> String {
        var i = i, j = j
        while i >= 0 && j < s.count && s[i] == s[j] {
            i -= 1
            j += 1
        }
        // 注意：由于退出循环时，i 和 j 分别指向了回文子串外的第一个不匹配的字符，所以需要用 i+1 和 j-1 来截取
        return String(s[i + 1..<j])
    }
}
