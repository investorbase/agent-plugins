# dispo

Sell a deal the way an InvestorBase pro does. Two skills, both read by Claude
Code and Codex:

- `find-buyers`: build the buyer pool for a deal. Asks before each paid search.
- `buyer-outreach`: build the call sheet, the texts and the voicemails. Drafts
  only. It never sends.

## Install

In Claude Code:

```
/plugin marketplace add investorbase/agent-plugins
/plugin install dispo@investorbase
```

In Codex:

```
codex plugin marketplace add investorbase/agent-plugins
codex plugin add dispo@investorbase
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

With no key, the skills still explain how a pro works, but they cannot search
buyers or read deals.

Support: support@investorbase.com
