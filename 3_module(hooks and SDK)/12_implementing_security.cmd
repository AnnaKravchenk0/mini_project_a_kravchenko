@REM LESSON 12
@REM Implementing a Security Hook
@REM ------------------------------------------------------


@REM prevent Claude from reading sensitive files like .env
@REM using a PreToolUse hook on the Read and Grep tools

@REM in .clade open settings.local.json hooks PreToolUse

.claude/settings.local.json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Read|Grep",
        @REM tool we want to watch for
        "hooks": [
          {
            "type": "command",
            "command": "node ./hooks/read_hook.js"
            @REM this is a node js script
          }
        ]
      }
    ]
  }
}


@REM matcher "Read|Grep" catches both tools because
@REM Claude could try to get .env contents through Grep too


@REM Claude tries to read a file
@REM PreToolUse triggers -> node ./hooks/read_hook.js runs
@REM hook reads stdin JSON, extracts the file path
@REM if path includes ".env" -> exit(2) + message to stderr
@REM Claude receives the error message and knows it can't read that file
@REM Claude adapts (tries a different approach, or skips the step)
@REM
@REM for all other files -> exit(0) -> Claude proceeds normally

@REM (this is shown in query_hook.js which I copied from the video)




@REM but this way is not extramely useful
@REM Claude could search for specific variable names inside .env
