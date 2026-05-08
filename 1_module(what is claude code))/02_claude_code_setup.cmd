@REM LESSON 02
@REM Claude Code Setup
@REM ------------------------------------------------------


@REM  I have Windows, so this is my code for instalation:
curl -fsSL https://claude.ai/install.cmd -o install.cmd && install.cmd && del install.cmd



@REM to start the claude go to your project folder and launch Claude Code
cd my-project
claude
@REM just write this in terminal and it will


@REM to initialize the project
@REM Claude generates CLAUDE.md
/init



@REM CLAUDE.md gives Claude context about your project every time it starts
@REM after /init you should review and edit it manually




@REM KEYBOARD SHORTCUTS

@REM Shift+Tab (once)   —> planning mode (Claude makes a plan and asks yes/no before acting)
@REM Shift+Tab (twice)  —> deeper planning mode
@REM Esc                —> stop Claude mid-execution
@REM Esc + Esc          —> go back to a previous point in the conversation
@REM Ctrl+V             —> paste from clipboard into the terminal interface
@REM # at start of line —> add memory before the conversation begins




@REM PLANNING MODE

@REM useful for complex tasks where you want to see what Claude will do
@REM before it actually does it.
@REM Claude presents a step-by-step plan -> you approve or reject each step


@REM THINKING MODE

@REM you can ask Claude to think harder by adding keywords in your prompt
@REM   think
@REM   think more
@REM   think a lotand
@REM   think longer
@REM   ultrathink



@REM I can also combine them

@REM you can use planning mode and thinking mode together:
@REM activate Shift+Tab, then add "think longer" in your prompt
@REM Claude will plan deeply AND ask for confirmation before each step
