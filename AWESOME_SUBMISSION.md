# Submitting to sindresorhus/awesome

> 提交到官方 Awesome 列表的完整指南

---

## 当前状态检查

| 要求 | 状态 | 说明 |
|------|------|------|
| 仓库存在 30+ 天 | ✅ | 创建于 2023 年 |
| 仓库名格式 `awesome-*` | ✅ | awesome-AI |
| 默认分支 `main` | ✅ | |
| Topics: awesome, awesome-list | ✅ | 已添加 |
| Awesome badge | ✅ | 已有 |
| 有目录 (Contents) | ✅ | README.md/README-EN.md 已统一为 "Contents" |
| 有项目描述 | ✅ | |
| 有贡献指南 | ✅ | CONTRIBUTING.md |
| 有行为准则 | ✅ | CODE_OF_CONDUCT.md |
| 许可证 | ✅ | 已使用 CC0-1.0 |
| awesome-lint 通过 | ⚠️ | 有警告但多为误报 |

---

## 提交前检查

### 1. Awesome Badge 位置

确保 badge 紧跟标题，当前已正确。

---

## 提交 PR 模板

向 https://github.com/sindresorhus/awesome 提交 PR 时使用：

### PR 标题
```
Add Awesome AI
```

### PR 正文
```markdown
## Checklist

- [x] I have read the [contributing guidelines](https://github.com/sindresorhus/awesome/blob/main/contributing.md)
- [x] The list is around for at least 30 days
- [x] I have searched for existing submissions and it's not a duplicate
- [x] The title is in format "Add Name of List"

## List Information

**Name**: Awesome AI

**Description**: A curated collection of 750+ AI tools across 50+ categories including Chat, Coding, Video, Image, Music, Enterprise applications, and more. Features bilingual support (English/Chinese), LLM comparison tables, and weekly automated link checks.

**Link**: https://github.com/Digidai/awesome-AI

**Why it's awesome**:
- Comprehensive: 750+ tools across 50+ categories
- Actively maintained: Updated weekly with automated link verification
- Practical: Includes pricing, accessibility info, and China-accessible alternatives
- Well-organized: LLM comparison table, icon legend, structured categories
- Community-driven: Open for contributions with clear guidelines

## Peer Reviews

I have reviewed the following PRs:
1. [PR #XXXX](link) - [Summary of review]
2. [PR #YYYY](link) - [Summary of review]
```

---

## 提交步骤

### Step 1: Fork 官方仓库
```bash
gh repo fork sindresorhus/awesome --clone
cd awesome
```

### Step 2: 找到合适位置

在 `readme.md` 中找到 "Miscellaneous" 或 "Platforms" 部分，或创建新的 AI 分类。

### Step 3: 添加条目
```markdown
- [Awesome AI](https://github.com/Digidai/awesome-AI#readme) - AI tools across 50+ categories.
```

### Step 4: 创建 PR
```bash
git checkout -b add-awesome-ai
git add readme.md
git commit -m "Add Awesome AI"
git push origin add-awesome-ai
gh pr create --title "Add Awesome AI" --body "..."
```

### Step 5: Review 其他 PR ⚠️ 重要

**必须** review 至少 2 个其他开放的 PR：
- 去 https://github.com/sindresorhus/awesome/pulls
- 找到未被 review 的 PR
- 认真检查并提出改进建议
- 在你的 PR 中注明你 review 了哪些

---

## 替代方案

如果官方提交被拒或等待时间长，可以考虑：

1. **awesome-selfhosted** - 如果有自托管相关工具
2. **awesome-machine-learning** - ML 相关
3. **GitHub Topics** - 已完成 ✅
4. **自主推广** - Reddit、HN、Twitter 等

---

## 时间线预估

| 阶段 | 时间 |
|------|------|
| 准备材料 | 1 天 |
| 提交 PR | 1 天 |
| Review 其他 PR | 1-2 天 |
| 等待审核 | 1-4 周 |
| 修改反馈 | 1-3 天 |
| 合并 | 1 天 |

**总计**: 2-6 周

---

## 注意事项

1. **PR 标题与列表名一致** - 使用 "Add Awesome AI"
2. **认真 review** - 敷衍的 review 会导致 PR 被拒
3. **保持耐心** - 官方维护者工作量大
4. **回应反馈** - 及时修改审核者提出的问题

---

*Last Updated: 2026-01-07*
