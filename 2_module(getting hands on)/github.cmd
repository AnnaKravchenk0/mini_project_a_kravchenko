it has github integration

/install-github-app
install claude code in git hub
give API key
it will give you a pull request


it has 2 defaut workflow
Mention Action: @claude in Issues and PRs, Pull Request Review Action


we can also customise:
go here: .github/workflows/claude-mention.yml
- name: Project Setup
  run: |
    npm run setup
    npm run dev:daemon


custom_instructions: |
  The project is already set up with all dependencies installed.
  The server is running at localhost:3000.
  If needed, use the mcp__playwright tools to launch a browser.







if i want to configure mcp server in github:
i need to dd something like this
mcp_config: |
  {
    "mcpServers": {
      "playwright": {
        "command": "npx",
        "args": ["@playwright/mcp@latest", "--allowed-origins", "localhost:3000"]
      }
    }
  }
allowed_tools: "Bash(npm:*),mcp__playwright__browser_snapshot,mcp__playwright__browser_click"
i have to allow every sevser manualy to work as an alowed tool (i need to add everythink that i want to use, i cant use short cuts), securiry reasons





