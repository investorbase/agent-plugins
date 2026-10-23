---
name: market-scan
description: Rank the zips of a market for wholesaling. Use when the user asks which zips or areas are best, where to buy, where investors are active, or wants to compare markets.
---

# Market scan

Rate the zips of a market by investor activity, the flipper and landlord mix,
prices and percent of ARV. Return a ranked list, with the one reason each zip
sits where it does.

## Before you spend anything

1. Call `get_usage` first. Each new location in `get_market_summary` and
   `search_investor_activity` counts against the monthly analytics allowance,
   shared with the app. A repeat of the same location is free.
2. `resolve_address` counts against its own monthly limit, one per call:
   `autocomplete` in `get_usage`. A scan calls it once per zip.
3. One zip is one location. Say how many zips the scan costs, then ask.

## With no account

Explain what makes a zip good for wholesaling, and what to look for. Offer to
add the InvestorBase API key, from Account, then Integrations, as the
`INVESTORBASE_API_KEY` environment variable, to read the market data.

## MCP tools

`get_usage`, `resolve_address`, `get_market_summary`,
`search_investor_activity`.

## Hand-off

When a deal lands in a top zip and the dispo plugin is installed, load its
`find-buyers` skill. In Claude Code, call the Skill tool with
"dispo:find-buyers".

## Playbook

### 1. Frame the scan

- Ask three things in one round: the exit (flippers, landlords or both), the
  price band the user contracts in, and the property type. Default to single
  family, `SFR`.
- Take the zip list from the user. No list? Offer the zips of the city they
  name, and say how many that is.

### 2. Pull the numbers

- For each zip: `resolve_address` with the zip as `search_string` for its center,
  then `get_market_summary` at that center with `lookback_months` 24,
  `metrics_radius_mi` 2 and the property type. Keep the same settings for
  every zip, so the ranking compares like with like.
- Read per zip: flips and rentals within 1, 2, 5 and 10 miles; the flipper
  price band and average; the flipper percent of ARV band and average; the
  landlord price band; the landlord aggressive, moderate and conservative
  purchase counts.
- `_low` and `_high` are the middle third of the sample, not the extremes.
  `_avg` includes every transaction, so it can fall outside that band. A zero
  means nothing qualified.
- When two zips tie, or the counts are small, run `search_investor_activity`
  at the center and read the deals themselves: street, type, size, buyer
  type, distance.

### 3. Score each zip

Rank on four things, in this order.

1. Activity: flips plus rentals within 2 miles over 24 months. A handful of
   purchases at 2 miles and 2 years means three or four investors there. A
   deal in that zip sells to a landlord from a nearby town, if at all.
2. Mix against the exit: a flipper-heavy zip for a user who sells rehabs, a
   landlord-heavy zip for a user who sells cash flow. Rural zips lean
   landlord, and rural buyers buy anything that cash flows.
3. Price fit: the flipper and landlord price bands must overlap the band the
   user contracts in. A zip where investors buy at 60,000 does not take a
   180,000 contract.
4. Percent of ARV: higher means flippers there pay more of the resale price,
   so a contract at the same number leaves more spread. It varies by pocket.
   About 44% in one town and 71% in the next is normal. Never assume a
   buyer's threshold, such as a 70% rule. Read what buyers paid in that zip.

For a landlord exit, the aggressive purchase count matters too. A zip where
landlords pay more relative to rent takes a higher contract.

### 4. Present the ranking

- One table: rank, zip, flips and rentals at 2 miles, flipper price band,
  percent of ARV average, landlord price band, the one reason.
- One reason per zip, in plain words: "most active, flippers pay 72% of ARV"
  or "cheap and thin, landlords only".
- Name the thin zips plainly. A zip with few investor purchases is a zip
  where the deal depends on luck.
- Say what the scan does not know. The seller side (days on market, price
  cuts, the share of listings reduced) comes from the MLS or a listing site,
  not from here. The user pulls those monthly, as negotiation ammunition.

### 5. After the scan

- The user markets to sellers in the top zips. Before any offer, flush the
  seller's asking price first, and ask for the number they would never take,
  not only what they hope for.
- When a deal lands, build the buyer pool from a fresh search at the subject.
  The scan picks the zip. It never replaces the search for one deal.

## Answers to common questions

- "Can I just use the 70% rule?" No. Percent of ARV varies by pocket. Read
  what buyers paid in that zip.
- "Why do two zips next to each other rank so differently?" Investor pockets
  are small. 44% of ARV in one town and 71% in the next is normal.
- "How fresh is the data?" County records, as the counties record them. A
  new purchase appears once the county records it.
- "Does a scan count against my buyer searches?" No. It counts against the
  analytics allowance and the address lookups, both separate. `get_usage`
  shows each one.
