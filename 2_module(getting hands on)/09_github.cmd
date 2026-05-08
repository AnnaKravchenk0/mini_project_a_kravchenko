@REM LESSON 09
@REM GitHub Integration for Automated Workflows
@REM ------------------------------------------------------



@REM it has github integration
@REM run this to install it
/install-github-app

@REM install claude code in git hub
@REM give API key


@REM it has 2 defaut workflow:



@REM 1. Mention Action:
@REM          @claude in Issues and PRs
@REM          Claude reads the context and responds or makes changes
@REM 2. Pull Request Review Action:
@REM          Claude automatically reviews new PRs when they are opened


@REM we can also customise the workfrow:

@REM go here: .github/workflows/claude-mention.yml
@REM you can add a setup step so Claude has a running app to work with:
@REM - name: Project Setup
@REM   run: |
@REM     npm run setup
@REM     npm run dev:daemon

@REM and custom instructions so Claude knows what environment it's in:

@REM custom_instructions: |
@REM   The project is already set up with all dependencies installed.
@REM   The server is running at localhost:3000.
@REM   If needed, use the mcp__playwright tools to launch a browser.







@REM if i want to configure mcp server in github

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



@REM I have to allow every mcp_tool manualy to work as an alowed tool
@REM (I need to add everything that I want to use, there are no shortcuts),
@REM securiry reasons

@REM if i forget to list a tool, Claude simply won't be able to use it,
@REM there will not be an error. It just won't try