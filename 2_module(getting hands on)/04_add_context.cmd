@REM LESSON 04
@REM Adding Context with CLAUDE.md
@REM ------------------------------------------------------



@REM to initialize the project
@REM Claude generates CLAUDE.md
/init


@REM CLAUDE.md gives Claude context about your project every time it starts
@REM after /init you should review and edit it manually


@REM Claude.md is the main way to give Claude persistent context about your project.
@REM it gets read automatically every time Claude Code starts.
@REM there are three locations, each with a different scope:

@REM CLAUDE.local.md (Personal)
@REM ~/.claude/CLAUDE.md (Global)
@REM CLAUDE.md (Project)



@REM Ctrl+V  —> paste from clipboard into the terminal interface



@REM @ before ny file to point in to Claude:

@REM reference a folder
How does the auth system work? @src/auth

@REM reference a specific file
Fix the bug in @src/components/UserCard.tsx

@REM reference multiple files
Compare the logic in @src/old/auth.ts and @src/new/auth.ts




@REM you can laso put your most important @ references in CLAUDE.md itself
@REM ("The database schema is defined in @prisma/schema.prisma."
@REM "Reference it whenever you need to understand data structure.")