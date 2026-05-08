@REM LESSON 14
@REM The Claude Code SDK
@REM ------------------------------------------------------


@REM SDK lets you run Claude Code from your own scripts.
@REM instead of the interactive terminal, you call Claude programmatically
@REM useful for CI/CD pipelines, custom tooling, and hooks


@REM rin this to install
npm install @anthropic-ai/claude-code


@REM hooks/query_hook.js uses the SDK


import { query } from "@anthropic-ai/claude-code";

const prompt = "Look for duplicate queries in the ./src/queries directory";

for await (const message of query({ prompt })) {
  console.log(JSON.stringify(message, null, 2));
}


@REM By default, the SDK only has read-only permissions
@REM it can read files, search directories, and run grep
@REM but cannot write, edit, or create files.
@REM To enable write access, explicitly grant tools:

for await (const message of query({
  prompt: "Refactor the utils module to use named exports",
  options: {
    allowedTools: ["Edit", "Write"]
  }
})) {
  console.log(JSON.stringify(message, null, 2));
}

@REM Practical Applications
@REM    automatically review staged changes before each commit
@REM    analyze and optimize code during the build process
@REM    run code quality checks with AI-powered analysis
@REM    automatically create or update docs from code changes
@REM    scheduled scripts that find and report technical debt
@REM    build team-specific CLI tools powered by Claude
