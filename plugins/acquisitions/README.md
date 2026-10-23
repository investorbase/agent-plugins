# acquisitions

Pick where to buy the way an InvestorBase pro does. One skill, read by Claude
Code and Codex:

- `market-scan`: rank the zips of a market by investor activity.

## Install

In Claude Code:

```
/plugin marketplace add investorbase/agent-plugins
/plugin install acquisitions@investorbase
```

In Codex:

```
codex plugin marketplace add investorbase/agent-plugins
codex plugin add acquisitions@investorbase
```

## API key

The plugin connects to the InvestorBase MCP at `https://api.investorbase.com/mcp`
with your InvestorBase API key. Copy it from **Account**, then **Integrations**,
in InvestorBase.

In Claude Code, the plugin asks for the key when you enable it, and keeps it
in your keychain. To change it, run `/plugin`, open the plugin, then pick
**Configure options**.

In Codex, set the key in your shell before you start Codex:

```
export INVESTORBASE_API_KEY=<your key>
```

With no key, the skill still explains what makes a zip good, but it cannot
read market data.

Support: support@investorbase.com
