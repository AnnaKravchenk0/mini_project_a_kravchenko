# Claude Code in Action
### Report

> Course link: claudecertifications.com/courses/claude-code-in-action

---
# For better information go to folder(modules) and look at notes taken there(for every single lesson)

---


### CLAUDE.md
There are 3 different Claude.md

- `~/.claude/CLAUDE.md` — global, applies to all projects
- `CLAUDE.md` — project-level, shared with team
- `CLAUDE.local.md` — personal project settings




### Slash Commands
Built-in: `/init`, `/compact`, `/clear` ...

Custom: you create: `.claude/commands/<name>.md` and it becomes `/<name>` cpmmand





### MCP Servers
Connecting external tools to improve Claude Code

Examples: Playwright (for browser)





### Hooks
Scripts that run automatically before or after Claude uses any tool
- `PreToolUse` — runs BEFORE the tool. Can block with exit code 2.
- `PostToolUse` — runs AFTER the tool. Cannot block, but can trigger follow-ups.

### SDK
`@anthropic-ai/claude-code` — run Claude Code programmatically from scripts,
CI/CD pipelines, or other hooks.




## Hook Exit Codes

| Code | Meaning |
|------|---------|
| `0` | Operation allowed, Claude continues normally |
| `2` | Operation blocked (PreToolUse only). message is sent to Claude |



---

## Some Basic Commands

```bash
# install
curl -fsSL https://claude.ai/install.cmd -o install.cmd && install.cmd && del install.cmd

# run
claude

# init project (generates CLAUDE.md)
/init

# compress context
/compact

# clear context
/clear

# add MCP server (example)
claude mcp add playwright npx @playwright/mcp@latest

# type check (useful after changes)
tsc --noEmit
```

---

## Key Shortcuts

| Key / Command | Function |
| :--- | :--- |
| `claude` | Start the assistant |
| `/init` | Create project |
| `/compact` | Compress conversation history |
| `/clear` | Wipe current session |
| `Ctrl+V` | Paste from clipboard into the terminal interface |
| `Shift + Tab` | Planning Mode |
| `Shift + Tab (twice)` | Depepr Planning Mode |
| `Esc + Esc` | Go back into conversation |
| `Esc` |Stop Claude mid-execution |
| `#` | Add to memory (start of line) |
| `@` | Reference a file or folder |

---

## Basic SetUp
- `CLAUDE.md` is initialized and manually reviewed for project-specific rules.
-  `CLAUDE.local.md` is created for personal environment settings.
-  `.claude/settings.local.json` contains `PreToolUse` hooks for sensitive file protection.
-  `hooks/query_hook.js` is implemented and tested to prevent logic duplication.
-  GitHub App is installed with `API_KEY` stored in repository secrets.
-  All debug log hooks are disabled or removed for daily use.
-  Claude Code has to be **restarted** to apply all configuration changes, (after every major change)







---
## Module 1: What Is Claude Code?

Claude Code unlike traditional AI chat interfaces, it functions as an autonomous developer within your terminal.

It doesn't just suggest code. It takes multi-step actions like: reads/writes files, executes terminal commands, analyzes error logs, and manages git state. It has full file system access, Git/GitHub integration, and ability to work with MCP.

* **Installation (Windows):** `curl -fsSL https://claude.ai/install.cmd -o install.cmd && install.cmd && del install.cmd`
* **Initialization:** Running `/init` creates a `CLAUDE.md` file






---

## Module 2: Getting Hands On


Claude Code operates along two axes:
1. **Planning Mode (`Shift + Tab`):** Used for **breadth**. Claude creates a step-by-step plan and asks for approval before modifying files. Best for refactors across multiple files.
2. **Thinking Mode:** Used for **depth**. Use sertain keywords like `think`, `think longer`, or `ultrathink` to force the AI to look deeper into complicated logic or bugs.


* **`/compact`**: This summarizes your current chat to save space in the AI's memory while keeping the important project details
* **`/clear`**: This completely wipes the current chat history so you can start a new task
* **Memory (`#`)**: If you put a hashtag at the start of a line, you can add notes for the AI to remember
* **File References (`@`)**: Point Claude to specific files or folders you want it to look at


There are three levels of instruction files:
1. `~/.claude/CLAUDE.md`: Global rules for all projects.
2. `./CLAUDE.md`: Project-specific rules shared with the team via Git.
3. `./CLAUDE.local.md`: Personal local settings (git-ignored).


You can create your own shortcuts by adding `.md` files to `.claude/commands/`.
* Example: `/audit` (runs security checks) or `/write_tests` (uses `$ARGUMENTS` to generate tests)


The MCP connects Claude to external tools.
* Example (Playwright): `claude mcp add playwright npx @playwright/mcp@latest`.
* This allows Claude to open a real browser, navigate to your app, and perform UI/E2E testing


Use `/install-github-app` to integrate Claude into your CI/CD workflow.
* Claude can respond to Issues and PRs with `@claude` mentions
* Automated PR reviews





---

## Module 3: Hooks and the SDK

Hooks allow you to run scripts automatically based on Claude's tool usage
* **PreToolUse:** This runs before Claude does something. It can block an action if it looks risky (like trying to open a private password file)
* **PostToolUse:** This runs after Claude finishes a task. It is great for automatic tasks, like fixing code formatting or checking for errors
* **Query Hook:** The "AI Reviewing AI" pattern. A hook uses the SDK to ask a second Claude instance if a proposed change duplicates existing logic


The `@anthropic-ai/claude-code` library allows for programmatic usage
* **Important:** SDK access is read-only by default. You must give it write permissions:
  `options: { allowedTools: ["Edit", "Write"] }`
* **Message Types:** While it works, it sends back different types of messages, like what it's thinking, what tool it's using, and the final result
    Streams `assistant` (thought), `tool_use`/`tool_result`, and final `result` messages


* **Type Safety:** Always run `tsc --noEmit` after Claude makes changes and feed any errors back to the assistant
* **Sprecific Writing:** Don't give vague instructions. Tell Claude exactly what to do, where the files are, and what rules to follow
* **Restarting:** f you change any settings or configuration files, you must restart Claude Code, or the changes won't take effect




---

## Module 4: Test Your Knowlendge
Did the final qiz