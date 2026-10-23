# agent-plugins

The public InvestorBase marketplace for Claude Code, the Claude app and Codex.
One plugin per area. Both tools read the same `SKILL.md` files.

## Map

```
.claude-plugin/marketplace.json   Claude Code catalog: name investorbase, one entry per plugin
.agents/plugins/marketplace.json  Codex catalog: same name, same plugins, local paths
plugins/<area>/
  .claude-plugin/plugin.json      name, version, author, license, keywords
  .codex-plugin/plugin.json       same name and version, plus the interface block Codex shows
  .mcp.json                       the InvestorBase MCP at https://api.investorbase.com/mcp
  skills/<skill>/SKILL.md         one skill, read by both tools
  skills/<skill>/agents/openai.yaml  the Codex picker name and description
  assets/logo.svg                 the mark shown next to the plugin
  LICENSE                         proprietary, one per plugin
  README.md                       what the plugin does, how to sign in
.github/workflows/validate.yml    runs scripts/lint.sh on every PR
.github/workflows/close-outside-prs.yml  closes a PR from outside the team
.github/CODEOWNERS                engineers own every file, admins own .github/
scripts/lint.sh                   the one check: manifests, versions, invocation, no em dash
scripts/bump-plugin-version.sh    bumps the patch version of a touched plugin, both manifests
scripts/githooks/pre-commit       lint, then bump
```

## Rules

- The catalog entry name, the plugin folder name and both manifest names are
  the same word. A customer installs `<name>@investorbase` and never
  reinstalls.
- Both manifests hold the same version. The pre-commit hook bumps the patch
  on every commit that touches the plugin. A minor or major bump written by
  hand wins.
- A skill is model-invoked or user-invoked in both tools, never one. See
  CONTRIBUTING.md.
- Every write to InvestorBase asks the customer first.
- Nothing internal: no transcripts, no names, no links to recordings, no
  internal tools or tickets.
- No em dash and no en dash anywhere. The lint fails on one.

## Check

```
scripts/lint.sh
```

Install the hook once: `git config core.hooksPath scripts/githooks`.
