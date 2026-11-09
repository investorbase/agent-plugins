# investorbase

Sell a deal and pick where to buy the way an InvestorBase pro does. Three
skills, all read by Claude Code and Codex:

- `find-buyers`: build the buyer pool for a deal. Asks before each paid search.
- `buyer-outreach`: build the call sheet, the texts and the voicemails. Drafts
  only. It never sends.
- `market-scan`: rank the zips of a market by investor activity.

## Install

In Claude Code:

```
/plugin marketplace add https://github.com/investorbase/agent-plugins
/plugin install investorbase@investorbase
```

In Codex:

```
codex plugin marketplace add https://github.com/investorbase/agent-plugins
codex plugin add investorbase@investorbase
```

## Sign in

The plugin connects to the InvestorBase MCP at `https://api.investorbase.com/mcp`.
The first call opens a sign-in at investorbase.com. With no account, the skills
still explain how a pro works, but they cannot search buyers, read deals or
read market data.

Support: support@investorbase.com
