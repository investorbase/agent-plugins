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

## Sign in

The plugin connects to the InvestorBase MCP at `https://api.investorbase.com/mcp`.
The first call opens a sign-in at investorbase.com. With no account, the skill
still explains what makes a zip good, but it cannot read market data.

Support: support@investorbase.com
