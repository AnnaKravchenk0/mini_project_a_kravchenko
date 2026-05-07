@REM / - these are default commands
@REM but you can make one yourself

@REM inside directory .claude
@REM Create a commands directory
@REM and create file audit.md
@REM (the name i=of the file is the name of the command we will create)


@REM from the video:
@REM Your goal is to update any vulnerable dependencies.
@REM Do the following:

Run a security audit on this project:

1. Run `npm audit` to identify vulnerable packages
2. Run `npm audit fix` to apply safe updates
3. Run the test suite to verify the updates did not break anything
4. Report which packages were updated and any remaining vulnerabilities

restart clude code
/audit


comands can reseice arguments
like this:

create another file with the name: write_tests.md
$ means argument

Write comprehensive tests for: $ARGUMENTS
Testing conventions:
* Use Vitests with React Testing Library
directory in the same folder as the source file * Place test files in a _ tests
* Name test files as [filename].test.ts(x)
* Use @/ prefix for imports
Coverage:
* Test happy paths
* Test edge cases
* Test error states
Focus on testing behavior and public API's rather than implementation details.

restart claude code
/write_tests the useAuth hook in src/hooks/use-auth.ts
it doent have to be file, or a pathway, it can be a string