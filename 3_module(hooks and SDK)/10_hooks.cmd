@REM LESSON 10
@REM Introduction to Claude Code Hooks
@REM ------------------------------------------------------




@REM Hooks allow to run custom commands automatically before or after Claude executes any tool

@REM Practical Hook Applications
@REM block Claude from reading sensitive files
@REM auto-format code after every edit
@REM run tests after changes to critical files
@REM log everything Claude does
@REM validate that new code follows project patterns



@REM there are 2 types of hooks:

@REM PreToolUse
@REM  runs BEFORE Claude uses a tool
@REM  can block the operation entirely
@REM  Claude receives your stderr message as an explanation

@REM PostToolUse
@REM  runs AFTER the tool has already executed
@REM cannot undo what Claude did
@REM   but can trigger follow-up actions (format, test, log)


@REM Hook Configuration Scopes
@REM Global (~/.claude/settings.json)
@REM Project (.claude/settings.json)
@REM Personal (.claude/settings.local.json)




@REM to add hooks we need to make some changes in files

@REM this is writen by hand in settings.json



{
    "hooks": {
        "PreToolUse": [
            {
                "matcher": "Read",
                "hooks": [
                    {
                    "type": "command
                    "command": "node /home/hooks/read_hook.ts"
                    }
                ]
            }
        ]
        "PostToolUse": [
            {
                "matcher": "Write|Edit|MultiEdit",
                "hooks": [
                    {
                        "type": "command
                        "command": "node /home/hooks/edit_hook.ts"
                    }
                ]
            }
        ]
    }
}

@REM restart Claude Code for changes to take effect

