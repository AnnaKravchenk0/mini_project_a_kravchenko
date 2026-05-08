@REM LESSON 08
@REM Extending Claude Code with MCP Servers
@REM ------------------------------------------------------



@REM MCP (Model Context Protocol) is a standard for connecting external tools to Claude Code.
@REM with MCP servers, Claude can interact with a browser, databases ...

@REM claude mcp add <name> <launch command>


@REM as example in the video
@REM playright allows claude to interact/control browser
claude mcp add playwright npx @playwright/mcp@latest



@REM by default Claude asks for permission every time it MCP
@REM to auto-allow a server without confirmation every time,
@REM we have to go to the .claude, inside setting.local.json, permissions
@REM and add the name inside the brakets

@REM .claude/settings.local.json
@REM like this:

{
  "permissions": {
    "allow": ["mcp__playwright"],
    "deny": []
  }
}

@REM restart Claude Code after editing settings


@REM Example from the video
@REM once Playwright is connected, Claude can open and interact with your app:
@REM go to .claude -> scr -> lib -> prompts -> genearation.tsx
@REM ask claude:
Your goal is to improve the compmonent generation prompt at @src/lib/prompts/generation.tsx. Here's how:\
1. Open a browser and navigate to localhost:3000\
2. Request a basic component to be generated\
3. Review the generated component and its source code\
4. Identify areas for improvement\
5. Update the prompt to produce better components going forward.\
For now, only evaluate visual styling aspects. We don't want components generated that look like typical tailwindcss components we want something more original.


