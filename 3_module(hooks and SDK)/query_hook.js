// hooks/query_hook.js
// PreToolUse hook — prevents Claude from adding duplicate database queries
//
// uses the Claude Code SDK to run a nested Claude call that reviews
// the proposed file content and checks for duplication.
//
// configured in .claude/settings.json:
// {
//   "hooks": {
//     "PreToolUse": [
//       { "matcher": "Write|Edit", "hooks": [{ "type": "command", "command": "node ./hooks/query_hook.js" }] }
//     ]
//   }
// }

import { query } from "@anthropic-ai/claude-code";
import path from "path";

const REVIEW_DIR = "src/queries";

async function main() {
  // read stdin — Claude sends tool data as JSON
  const input = await new Promise((resolve) => {
    let data = "";
    process.stdin.on("data", (chunk) => (data += chunk));
    process.stdin.on("end", () => resolve(data));
  });

  const hookData = JSON.parse(input);
  const toolInput = hookData.tool_input;

  // get the file path Claude wants to write
  const filePath = toolInput.file_path || toolInput.path;
  if (!filePath) {
    process.exit(0); // no path — not relevant, allow
  }

  // only check files inside the queries directory
  const normalizedFilePath = path.resolve(filePath);
  const queriesDir = path.resolve(process.cwd(), REVIEW_DIR);

  if (!normalizedFilePath.startsWith(queriesDir + path.sep)) {
    process.exit(0); // not in queries dir — allow
  }

  // prepare a prompt for the nested Claude call
  const newContent = toolInput.content || toolInput.contents;
  const prompt = `You are reviewing a proposed change to a database query file.
Your task is to analyze if the new or modified query functions could be accomplished
by reusing or slightly modifying existing query functions.
Within reason, we want to prevent duplicate queries from being added.

File: ${filePath}

New content:
<new_content>
${newContent}
</new_content>

If the changes are appropriate and not duplicating existing functionality,
respond with exactly: Changes look appropriate.
Otherwise, explain clearly what is being duplicated and what already exists.`;

  // run a nested Claude call to analyze the content
  const messages = [];
  for await (const message of query({
    prompt,
    abortController: new AbortController(),
  })) {
    messages.push(message);
  }

  // find the final result message
  const resultMessage = messages.find((m) => m.type === "result");

  if (!resultMessage || resultMessage.subtype !== "success") {
    process.exit(0); // something went wrong with the analysis — allow to be safe
  }

  // if Claude says it's fine — allow the write
  if (resultMessage.result.includes("Changes look appropriate")) {
    process.exit(0);
  }

  // otherwise block and explain why
  console.error(`Query duplication detected:\n\n${resultMessage.result}`);
  process.exit(2);
}

main().catch((err) => {
  console.error(`Hook error: ${err.message}`);
  process.exit(1);
});
