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

// class Solution {
//    func lengthOfLongestSubstring(_ s: String) -> Int {
//        let chs = [Character](s)
//        var ans = 0
//        var window = Set<Character>()
//        // s[left..right) = Window Substring
//        // s[right..n-1]  = Scanning
//        var left = 0
//        var right = 0
//        while right < chs.count {
//            let add = chs[right]
//            if !window.contains(add) {
//                window.insert(add)
//                right += 1
//                ans = max(ans, right - left)
//            } else {
//                while left < right {
//                    let del = chs[left]
//                    left += 1
//                    window.remove(del)
//                    if del == add {
//                        break
//                    }
//                }
//            }
//        }
//        return ans
//    }
// }

class Solution {
    /// 查找给定字符串中最长的不含重复字符的子串的长度
    ///
    /// 本函数使用滑动窗口算法来实现。它维护一个窗口，该窗口内的所有字符都不重复。
    /// 窗口通过两个指针定义：`left` 和 `right`，其中 `left` 是窗口的开始位置，`right` 是窗口的结束位置。
    /// 算法逐步扩大窗口（通过移动 `right` 指针）来探索可能的解，并在必要时通过移动 `left` 指针来缩小窗口，
    /// 以保证窗口内的所有字符都不重复。
    ///
    /// - Parameter s: 输入的字符串
    /// - Returns: 不含重复字符的最长子串的长度
    ///
    /// 在遍历字符串的过程中，使用一个集合 `window` 来存储当前窗口内的字符，以快速检查字符是否重复。
    /// 如果尝试添加到窗口的字符在 `window` 中不存在，说明当前字符不重复，将其加入 `window`，
    /// 并更新答案 `ans` 为当前窗口的长度。如果字符已存在，则逐个从窗口开始位置移除字符，直到移除了重复的字符，
    /// 在这个过程中不断调整 `left` 指针。最终，`ans` 中存储的就是最长不含重复字符的子串的长度。
    func lengthOfLongestSubstring(_ s: String) -> Int {
        let chs = [Character](s)
        var ans = 0
        var window = Set<Character>()
        // s[left..right) = Window Substring
        // s[right..n-1]  = Scanning
        var left = 0
        var right = 0
        while right < chs.count {
            let add = chs[right]
            if !window.contains(add) {
                window.insert(add)
                right += 1
                ans = max(ans, right - left)
            } else {
                while left < right {
                    let del = chs[left]
                    left += 1
                    window.remove(del)
                    if del == add {
                        break
                    }
                }
            }
        }
        return ans
    }
}
