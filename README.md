# InvestorBase for Claude

[![Watch: Connect Claude to InvestorBase in under 30 seconds](https://i.vimeocdn.com/filter/overlay?src0=https%3A%2F%2Fi.vimeocdn.com%2Fvideo%2F2224689139-341b48d581cfc3efd0fcb9edcecba5fbfd4e6673dc50cb54c05e50a7ea51c752-d_1280%3Fregion%3Dus&src1=http%3A%2F%2Ff.vimeocdn.com%2Fp%2Fimages%2Fcrawler_play.png)](https://vimeo.com/1245538603)

Ask Claude to find buyers for your deal, write your call sheet, or pick the best
zips in a market. Claude works the deal the way an InvestorBase pro does, with
your InvestorBase data.

The plugin is free. To use your own data, you need an InvestorBase account.
With no account, Claude still explains how a pro works a deal.

## Set it up in the Claude app

This works in the Claude app and in Cowork.

1. Open Claude and click **Customize**.
2. Click **Plugins**.
3. Click **Add**, then **Add marketplace**.
4. Click **Add from a repository** and paste this link:
   ```
   https://github.com/investorbase/agent-plugins
   ```
5. Turn on **investorbase**.
6. Ask Claude to find buyers for your deal. The first time, sign in to
   InvestorBase and click **Connect**.

## What you can ask

Type your question in plain words. Claude knows when to use InvestorBase.

| You want to | Ask Claude something like |
| --- | --- |
| Find buyers for a deal | "Find buyers for 123 Main St, Dallas, TX" |
| Know what to say to buyers | "Build my call sheet for today" |
| Answer a buyer | "A buyer wants the details. What do I text back?" |
| Pick where to buy | "Which zips in Memphis are best for wholesaling?" |

## What Claude does and does not do

- **It asks before it spends.** Some searches count against your monthly
  InvestorBase limits. Claude tells you what you have left, then asks first.
- **It asks before it changes your account.** Saving a deal to My Deals or
  adding a buyer to your Buyers List needs your yes.
- **It never sends a message.** Claude writes your texts, voicemails and
  scripts. You send them yourself.

## Keep it up to date

In the Claude app, click **Check for updates**, or turn on **Sync
automatically**.

## Need help?

Email support@investorbase.com.

## For developers

The plugin lives in [plugins/investorbase](plugins/investorbase). It has three
skills: `find-buyers`, `buyer-outreach` and `market-scan`.

Install it in Claude Code:

```
/plugin marketplace add https://github.com/investorbase/agent-plugins
/plugin install investorbase@investorbase
```

Install it in Codex:

```
codex plugin marketplace add https://github.com/investorbase/agent-plugins
codex plugin add investorbase@investorbase
```

The plugin connects to the InvestorBase MCP at `https://api.investorbase.com/mcp`.
The first call opens a sign-in at investorbase.com.

In Claude Code, auto-update is off for a new marketplace. Run `/plugin`, open
**Marketplaces**, pick **investorbase**, then **Enable auto-update**. Or run
`claude plugin update investorbase@investorbase` when you want the latest.

This repo has no issue tracker. Questions go to support@investorbase.com.
