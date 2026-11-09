# InvestorBase plugins

Skills that teach Claude and Codex how an InvestorBase pro works a deal. The
skills are free. The InvestorBase data behind them needs an account.

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

In the Claude app or Cowork: open **Customize**, then **Plugins**. Pick
**Add**, then **Add marketplace**, and enter
`https://github.com/investorbase/agent-plugins`. Then add **investorbase**.

## Plugins

| Plugin | What it does | Skills |
| --- | --- | --- |
| [investorbase](plugins/investorbase) | Sell a deal: find the buyers, build the call sheet. Buy in the right place: rank the zips of a market. | `find-buyers`, `buyer-outreach`, `market-scan` |

## Sign in

Each plugin connects to the InvestorBase MCP at `https://api.investorbase.com/mcp`.
The first call opens a sign-in at investorbase.com. With no account, the
skills still explain how a pro works. Signed in, Claude searches buyers, reads
deals and scans markets. Every write to your account asks you first.

## Updates

In Claude Code, auto-update is off for a new marketplace. Run `/plugin`, open
**Marketplaces**, pick **investorbase**, then **Enable auto-update**. Or run
`claude plugin update investorbase@investorbase` when you want the latest.

In the Claude app, pick **Check for updates**, or turn on **Sync automatically**.

## Support

support@investorbase.com. This repo has no issue tracker.
