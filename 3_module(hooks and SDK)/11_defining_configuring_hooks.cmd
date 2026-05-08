@REM LESSON 11
@REM Defining and Configuring Hooks
@REM ------------------------------------------------------


@REM hooks receive data from Claude via stdin as JSON.

@REM Standard Input (JSON):
{
  "session_id": "2d6a1e4d-6...",
  "transcript_path": "/Users/dev/.claude/transcripts/...",
  "hook_event_name": "PreToolUse",
  "tool_name": "Read",
  "tool_input": {
    "file_path": "/code/project/.env"
  }
}


> claude
> List out all the toll you have access to, bullet point List
@REM to see all tools Claude has access to, ask it directly:
@REM   "List out all the tools you have access to, bullet point list"


@REM   Read
@REM   Write
@REM   Edit
@REM   MultiEdit
@REM   Bash
@REM   Grep
@REM   WebFetch




@REM exit code 0  ->  allow the operation, Claude continues
@REM exit code 2  ->  block the operation (PreToolUse only)

