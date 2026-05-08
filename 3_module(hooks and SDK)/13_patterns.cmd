@REM LESSON 13
@REM Useful Hook Patterns for Real Projects
@REM ------------------------------------------------------



@REM claide sometimes runs into problems
@REM it doesn't always apply changes correctly on the first try.
@REM a few patterns help keep it on track.


tsc --noEmit
@REM if there are errors, paste them back to Claude:
@REM   "Fix these TypeScript errors: <paste output>"
@REM Claude will correct them. Repeat until clean.






@REM bad:
@REM   "Add a Slack notification"

@REM good:
@REM   "@main.ts is executed automatically once per day as a cron job.
@REM    Add a new Slack integration in a separate file. Then whenever this runs,
@REM    check for orders that have been pending more than 3 days
@REM    and send an alert to the #order-alerts channel with customer name
@REM    and phone number so someone can follow up.
@REM    @schema.ts contains the current db structure.
@REM    Remember, all queries should be placed in the ./queries dir.
@REM    Start with the Slack integration."




@REM Shift+Tab → Claude creates a plan → you review → Claude executes
@REM do this for: database migrations, refactors across many files, anything hard to undo



@REM after many messages, context fills up and Claude starts forgetting earlier decisions.
@REM /compact summarizes the history and keeps the important parts.
@REM do this proactively, before you notice degraded responses.




@REM while developing hooks, add this to settings.json:

"PostToolUse": [
  {
    "matcher": "*",
    "hooks": [
      {
        "type": "command",
        "command": "jq . > hook-debug-log.json"
      }
    ]
  }
]

@REM every tool call gets logged. inspect the file to understand
@REM exactly what data your hooks receive.
@REM remove this when done — it creates noise in normal use.

@REM restart claude

settings.json (debugging)
"PostToolUse": [
  {
    "matcher": "*",
    "hooks": [
      {
        "type": "command",
        "command": "jq . > hook-debug-log.json"
      }
    ]
  }
]
