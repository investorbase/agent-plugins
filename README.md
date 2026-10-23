# InvestorBase plugins

Skills that teach Claude and Codex how an InvestorBase pro works a deal. One
plugin per area. The skills are free. The InvestorBase data behind them needs
an account.

## Install

In Claude Code:

```
/plugin marketplace add https://github.com/investorbase/agent-plugins
/plugin install dispo@investorbase
/plugin install acquisitions@investorbase
```

In Codex:

```
codex plugin marketplace add https://github.com/investorbase/agent-plugins
codex plugin add dispo@investorbase
codex plugin add acquisitions@investorbase
```

In the Claude app or Cowork: open **Customize**, then **Plugins**. Pick
**Add**, then **Add marketplace**, and enter
`https://github.com/investorbase/agent-plugins`. Then add **dispo** or
**acquisitions**.

## Plugins

| Plugin | What it does | Skills |
| --- | --- | --- |
| [dispo](plugins/dispo) | Sell a deal: find the buyers, build the call sheet. | `find-buyers`, `buyer-outreach` |
| [acquisitions](plugins/acquisitions) | Buy in the right place: rank the zips of a market. | `market-scan` |

## API key

Each plugin connects to the InvestorBase MCP at `https://api.investorbase.com/mcp`
with your InvestorBase API key. Copy it from **Account**, then **Integrations**,
in InvestorBase. Every app reads it from the `INVESTORBASE_API_KEY` environment
variable.

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

With no key, the skills still explain how a pro works. With a key, Claude
searches buyers, reads deals and scans markets. Every write to your account
asks you first.

## Updates

In Claude Code, auto-update is off for a new marketplace. Run `/plugin`, open
**Marketplaces**, pick **investorbase**, then **Enable auto-update**. Or run
`claude plugin update dispo@investorbase` when you want the latest.

In the Claude app, pick **Check for updates**, or turn on **Sync automatically**.

## Support

support@investorbase.com. This repo has no issue tracker.
