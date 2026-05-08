@REM LESSON 07
@REM Building Custom Commands
@REM ------------------------------------------------------


@REM / - these are default commands
@REM but you can make one yourself

@REM inside directory .claude
@REM Create a commands directory
@REM and create file name.md in .claude/commands/
@REM (the name of the file is the name of the command we will create)




@REM FROM THE VIDEO





@REM EXAMPLE 1 (just the command)

@REM Your goal is to update any vulnerable dependencies.
@REM Do the following:

@REM Run a security audit on this project:

@REM 1. Run `npm audit` to identify vulnerable packages
@REM 2. Run `npm audit fix` to apply safe updates
@REM 3. Run the test suite to verify the updates did not break anything
@REM 4. Report which packages were updated and any remaining vulnerabilities

@REM after we did that. Restart clade code
/audit



@REM EXAMPLE 2 (command with argument)

@REM commands can receive arguments with $ARGUMENTS
@REM $ means argument that we want to include
@REM like this:

@REM create another file with the name: write_tests.md
@REM content:

@REM Write comprehensive tests for: $ARGUMENTS
@REM
@REM Testing conventions:
@REM * Use Vitest with React Testing Library
@REM * Place test files in a __tests__ directory alongside the source file
@REM * Name test files as [filename].test.ts(x)
@REM * Use @/ prefix for all imports
@REM
@REM Coverage:
@REM * Test happy paths and expected behavior
@REM * Test edge cases and boundary conditions
@REM * Test error states and error handling



@REM restart claude code, then write
/write_tests the useAuth hook in src/hooks/use-auth.ts

@REM $ARGUMENTS doesn't have to be a file path — it can be any string:
/write_tests user registration flow including email validation




@REM you need to restart Claude Code after adding or editing a command file
@REM commands are just markdown —> Claude reads them as instructions
