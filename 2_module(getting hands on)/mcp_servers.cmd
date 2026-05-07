we can add new tools with mcp servers

playright allows claude to interact with browser

claude mcp add playwright npx @playwright/mcp@latest

we have to give permission every time
if we dont want to use that we have to go to the .claude
inside setting.local.json
permissions
and add the name inside the brakets
like this:

{
  "permissions": {
    "allow": ["mcp__playwright"],
    "deny": []
  }
}

restart claude code

go to .claude -> scr -> lib -> prompts -> genearation.tsx

ask claude:

Your goal is to improve the compmonent generation prompt at @src/lib/prompts/generation.tsx. Here's how:\
1. Open a browser and navigate to localhost:3000\
2. Request a basic component to be generated\
3. Review the generated component and its source code\
4. Identify areas for improvement\
5. Update the prompt to produce better components going forward.\
For now, only evaluate visual styling aspects. We don't want components generated that look like typical tailwindcss components we want something more original.


