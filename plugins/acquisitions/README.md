# acquisitions

Pick where to buy the way an InvestorBase pro does. One skill, read by Claude
Code and Codex:

- `market-scan`: rank the zips of a market by investor activity.

## Install

In Claude Code:

```
/plugin marketplace add https://github.com/investorbase/agent-plugins
/plugin install acquisitions@investorbase
```

In Codex:

```
codex plugin marketplace add https://github.com/investorbase/agent-plugins
codex plugin add acquisitions@investorbase
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

With no key, the skill still explains what makes a zip good, but it cannot
read market data.

Support: support@investorbase.com
