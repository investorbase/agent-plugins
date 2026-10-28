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

## Sign in

The plugin connects to the InvestorBase MCP at `https://api.investorbase.com/mcp`.
The first call opens a sign-in at investorbase.com. With no account, the skills
still explain how a pro works, but they cannot search buyers or read deals.

Support: support@investorbase.com
