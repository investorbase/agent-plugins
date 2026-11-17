# agent-plugins

The public InvestorBase marketplace for Claude Code, the Claude app and Codex.
One plugin, `investorbase`. Both tools read the same `SKILL.md` files.

## Map

```
.claude-plugin/marketplace.json   Claude Code catalog: name investorbase, one entry per plugin
.agents/plugins/marketplace.json  Codex catalog: same name, same plugins, local paths
plugins/investorbase/
  .claude-plugin/plugin.json      name, version, author, license, keywords
  .codex-plugin/plugin.json       same name and version, plus the interface block Codex shows
  plugin.json                     Agent Plugins manifest for ChatGPT: same name and version, plus the review block
  .mcp.json                       the InvestorBase MCP at https://api.investorbase.com/mcp, OAuth sign-in
  mcp.json                        the same file as .mcp.json, under the name ChatGPT reads
  skills/<skill>/SKILL.md         one skill, read by both tools
  skills/<skill>/agents/openai.yaml  the Codex picker name and description
  assets/logo.svg                 the mark shown next to the plugin
  assets/icon.png, logo.png       the images ChatGPT shows
  LICENSE                         proprietary, one per plugin
  README.md                       what the plugin does, how to sign in
.github/workflows/validate.yml    runs scripts/lint.sh on every PR
.github/CODEOWNERS                engineers own every file, admins own .github/
.github/rulesets/*.json           the rulesets to create when the repo goes public
scripts/lint.sh                   the one check: manifests, versions, invocation, no em dash
scripts/bump-plugin-version.sh    bumps the patch version of a touched plugin, all three manifests
scripts/package-chatgpt.sh        zips the whole plugin into dist/investorbase-<version>.zip for OpenAI
scripts/githooks/pre-commit       lint, then bump
```

## Rules

- The catalog entry name, the plugin folder name and every manifest name are
  the same word. A customer installs `<name>@investorbase` and never
  reinstalls.
- The three manifests hold the same version: `.claude-plugin/plugin.json`,
  `.codex-plugin/plugin.json` and `plugin.json`. The lint fails when one
  differs. The pre-commit hook bumps the patch in all three on every commit
  that touches the plugin. A minor or major bump written by hand wins.
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

## Package for ChatGPT

```
scripts/package-chatgpt.sh
```

It writes `dist/investorbase-<version>.zip` with the whole `plugins/investorbase`
folder, minus what git ignores. `plugin.json` sits at the root of the zip.
That zip is the file submitted to OpenAI.
