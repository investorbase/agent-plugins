# Contributing

This repo takes changes from the InvestorBase team. A pull request from
outside the team closes with a link to support@investorbase.com.

## Set up

```
git clone git@github.com:investorbase/agent-plugins.git
cd agent-plugins
git config core.hooksPath scripts/githooks
```

The hook runs `scripts/lint.sh` on every commit, then bumps the patch version
of each plugin the commit touches, in both manifests.

## Add a skill

1. Create `plugins/<plugin>/skills/<skill>/SKILL.md` with `name` and
   `description` in the frontmatter.
2. Create `agents/openai.yaml` beside it, with `interface.display_name` and
   `interface.short_description`.
3. A skill the model may reach keeps trigger phrases in its description, and
   sets no policy. A skill only a person may run sets
   `disable-model-invocation: true` in `SKILL.md` and
   `policy.allow_implicit_invocation: false` in `openai.yaml`. Never one
   without the other.
4. A skill calls another in two parts: load the `<skill>` skill, then, for
   Claude Code, call the Skill tool with "<plugin>:<skill>". Never a bare
   `/name`, and never the short name alone, because another plugin can use
   the same name.
5. Run `scripts/lint.sh`. CI runs the same file.

## Rules for a public repo

- Lessons in InvestorBase's own words. No transcripts, no recordings, no links
  to them.
- No customer, guest or prospect names.
- Every write to InvestorBase asks the customer first. A skill that sends a
  message for the customer is user-invoked only.
- Never push a branch that started in another repo. Its history would publish
  every old file.

## Release

A merge to `main` is a release. The hook already bumped the version. A
maintainer tags `<plugin>-v<version>` by hand when a release is worth naming.
