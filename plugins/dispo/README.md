# dispo

Sell a deal the way an InvestorBase pro does. Two skills, both read by Claude
Code and Codex:

- `find-buyers`: build the buyer pool for a deal. Asks before each paid search.
- `buyer-outreach`: build the call sheet, the texts and the voicemails. Drafts
  only. It never sends.

## Install

In Claude Code:

```
/plugin marketplace add https://github.com/investorbase/agent-plugins
/plugin install dispo@investorbase
```

In Codex:

```
codex plugin marketplace add https://github.com/investorbase/agent-plugins
codex plugin add dispo@investorbase
```

## API key

The plugin connects to the InvestorBase MCP at `https://api.investorbase.com/mcp`
with your InvestorBase API key. Every app reads it from the
`INVESTORBASE_API_KEY` environment variable.

To get the key:

1. Sign in to InvestorBase, then open
   <https://www.investorbase.com/account?tab=integrations>.
2. Under **API Key**, select **Generate API Key** if you have no key yet.
3. Select the copy button next to the key.

In the Claude app, open the environment selector. Click the gear icon on your
local environment, or create one with **New environment**. Select
**Environment variables**, add this line, select **Done**, then **Save**:

```
INVESTORBASE_API_KEY=<your key>
```

Then start a new session from that environment.

In Claude Code or Codex, set it in your shell before you start them:

```
export INVESTORBASE_API_KEY=<your key>
```

With no key, the skills still explain how a pro works, but they cannot search
buyers or read deals.

Support: support@investorbase.com
