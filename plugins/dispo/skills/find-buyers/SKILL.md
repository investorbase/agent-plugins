---
name: find-buyers
description: Find buyers whose buy box fits a deal. Use when the user wants buyers for a property, asks who would buy it, mentions a buy box, says the search shows too few buyers, or wants to grow their buyers list.
---

# Find buyers

Build the buyer pool for one deal, and grow the Buyers List over time.

Every deal gets two buckets: a fresh Buyer Search from the subject property,
and the Buyers List filtered down to the few who fit. Widen with care when
results run short. Read each top buyer's deal history before anyone calls.
Then hand the pool to buyer-outreach.

## Before you spend anything

1. Call `get_usage` first. Tell the user how many buyer searches are left.
2. Ask before each `search_buyers` call. A search spends the monthly allowance.
   Pass `create_deal: false` while exploring. Send `true` only when the user
   wants the deal saved in My Deals, because that writes to their account.
3. Ask before `create_buyers_list_buyer`. It writes to the user's account.
4. `resolve_address` and `get_buyer_history` each count against their own
   monthly limit, one per call: `autocomplete` and `linked_deals` in
   `get_usage`. Before you read the history of many buyers, say how many
   reads that is, then ask.

## With no account

Explain how a pro builds the pool, and what to look for in a buyer. Offer to
add the InvestorBase API key, from
https://www.investorbase.com/account?tab=integrations, as the
`INVESTORBASE_API_KEY` environment variable, when the user wants the search
run.

## MCP tools

`get_usage`, `resolve_address`, `search_buyers`, `get_buyer_history`,
`get_market_summary`, `get_buyers_list`, `create_buyers_list_buyer`.

## Hand-off

When the pool reaches target, load the `buyer-outreach` skill. In Claude
Code, call the Skill tool with "dispo:buyer-outreach".

## Playbook

### 1. Set the target

- Target 100 or more unique buyers, and 75 or more with a valid phone, before
  outreach starts. Below 100 the outcome depends on luck.
- Why 100: about 1 buyer in 10 has no number, some numbers are wrong, and some
  buyers have bad timing. About 75 stay reachable.
- Count unique buyers, not transactions. One buyer with four flips is one call.
- "Five or ten buyers is all you need" is a myth. Buyers fill up, travel,
  leave, or switch to another asset. A big pool also covers the odd deal: the
  ugly duplex, the 7-bed, land, a mobile home.
- The right buyer has three things: capability (can close), interest (buys
  this type, price and market) and urgency (bought recently).

### 2. Run the search from the subject

- Resolve the address with `resolve_address`, then run `search_buyers`.
  Baseline: `radius_miles` 2 and `lookback_years` 2.
- Always set `property_types`. It drives the SmartMatch order and cuts "not
  interested" replies. A duplex is multifamily, so send `SFR` and `MFR`
  together. Rural: send `SFR`, `MFR` and `MOBILE` together, because rural
  buyers buy anything that cash flows.
- Set `buyer_types` when the exit is clear: a full gut goes to flippers. Keep
  both on a rural deal, and in a market where landlords also take rehabs.
- Keep 2 years, not 1. A flipper still in rehab has not resold yet, so the
  data shows them as a landlord for now.
- Keep `hide_no_phone` off. The big buyers often sit behind an attorney or a
  holding company. Dig for those numbers instead (step 6).
- Use the bed, bath and price filters only for an unusual deal: a 450 square
  foot one-bed, a 7-bed, a turnkey rental for appreciation buyers. A purchase
  price floor weeds out buyers who only buy dirt cheap, and lifts response on
  a turnkey.
- When the averages from `get_market_summary` sit below the asking price,
  rerun landlord-only with a price floor near the asking band. That list
  beats the open search.

### 3. Widen when results run short

- Zero results at 2 miles and 2 years usually means only three or four
  investors there. Widen step by step: 10 miles and 3 years, then 10 miles
  and 5 years.
- Under 100 unique buyers at 10 miles and 5 years means thin investor
  activity. Say so. Then run the box method.
- Box method: pick the 4 or 5 larger towns around the deal. Run a search from
  an address on each town's outskirts, facing the deal. Sort by linked deals
  and look for holdings along the highways toward it. Check `get_usage`
  first: it is 4 or 5 searches. Expect it on about 1 deal in 4 nationwide.
- Rural: start at 5 miles and 2 years, or 10 miles and 5 years, and pull
  buyers from the metros on either side. Rural buyers drive about two hours
  from home and cross state lines. Nine rural deals in ten sell to a landlord
  from a nearby town.
- Land and odd houses: run two searches and merge them. A house search capped
  at 3 beds and 2 baths finds small-house flippers. A `LAND` search finds
  builders and developers. On a big lot with no like-kind comps, widen to 5
  miles and 3 years and add the land search.

### 4. Read the buyers

- SmartMatch ranks the result by fit to the deal. Work it top down. Move an
  obvious best fit to the front: the buyer who flips 600 to 900 square foot
  houses, for a tiny house. Do not stop at the top of the list. The 50th
  buyer may pay the most.
- Your comps are your buyers. The investors behind the comps are the ones who
  will buy the deal.
- Read a buy box off a buyer's nearby deals with `get_buyer_history`. Low
  buys with quick, light resales mark a low-touch buyer. Only 3/1s at one
  price is a tight buy box. A flip turned in about 100 days points to an
  in-house crew.
- A "flip" with a 0 to 1 month turn and new-build photos is a builder or a
  teardown. A lot bought very low and resold for several times that was a
  scrape. Look before you count it.
- Percent of ARV on a buyer is purchase price over resale price, before
  rehab. It shows for flippers only. Sort flippers by it to list the highest
  payers first. Sort landlords by purchase price or price per square foot.
- A zero-price purchase is a transfer between related parties. Recent priced
  purchases show the landlord still buys.
- Buy boxes drift. What someone bought two years ago is not what they buy
  now. Ask buyers with few deals directly.
- Jump the queue for a buyer with hundreds of linked deals in one town, and
  for a volume buyer who just bought across the street, even though volume
  buyers rarely pay top dollar. A local landlord with 30 or more linked deals
  earns extra touches.
- Skip buyers who will not buy wholesale: institutional names (an acronym, a
  number and "Holdings") and government entities buying for affordable
  housing. A fund that shows up likely buys that type there, but it keeps a
  strict buy box and can leave a market overnight.
- The mailing address on a buyer's deal tells you whether the buyer is local.
- Expect a few buyers who also wholesale on the side, not a marketplace's
  share. The search finds people whose recorded flip or rental sits by the
  deal. Nobody opted in.

### 5. Add the agents

- Add the listing agent on a flipper's flip, and the buyer's agent on an MLS
  buy-and-hold. Those numbers are right. A flipper's agent will connect the
  user and push for them.
- Tell agents plainly that they get paid, from the buyer's offer or on top,
  and compare offers by the user's net. One agent with 10 investor clients
  can create several offers.
- When an agent calls hoping to list the deal, pitch a finder's fee for a
  buyer instead. Those agents later send pocket listings.

### 6. Dig for missing numbers

- A buyer with no number who flipped across the street is still a top
  target. Dig for it.
- The path: the state corporation registry and its registered agent, the
  company's website or social pages, then a people-search site for an
  individual. A 30-second web search often finds an office line or a lead
  form.
- For the rest, one handwritten letter. Slow for this deal, good for the
  list.
- Research, then get on the phone. A dispo rep does not spend the day
  researching buyers.

### 7. Filter the Buyers List

- The saved list never replaces a fresh search. A deal in a new area may
  match none of them. Still start each deal there: filter with
  `get_buyers_list` by location, buyer type, property type and price, call
  the warm buyers, then call the new SmartMatch buyers, who may pay more.
- Niche the list to the few who fit, and call each one. One thousand buyers
  down to 10 beats a blast to all of them. A deal sent to buyers who do not
  fit makes the list go numb. One city's deal sent to another city's buyers
  erodes trust.
- There is one Buyers List. Filter it by zip, city or county instead of
  keeping one list per market. Keep the zips current. Some buyers buy only a
  few of them.

### 8. Grow the list on every deal

- A list that does not grow shrinks. About 8 buyers in 10 on a 10-year-old
  list no longer buy, or buy something else. A big list is no longer an
  edge. Anyone can pull one in seconds. The relationships are the edge.
- The KPI: add 10 buyers per deal, each after a real conversation that
  captured a buy box. Save the buyers the user spoke with even when the deal
  dies. A "not interested" that yields a buy box is a win.
- Capture the limits on the call: max price, max rehab, no well or septic,
  in-city only, no HOA. Record them with `create_buyers_list_buyer`, after
  the user says yes.
- Run the user's current buyers through `get_buyer_history` too. A buyer who
  bought 18 rentals from them may have flipped 54.
- New market: the dispo rep talks to 100 good buyers there and adds them by
  the end of the week.

## Answers to common questions

- "How many buyers do I need?" 100 or more unique buyers, 75 or more with a
  valid phone.
- "Will I just get wholesalers like on a marketplace?" No. The search finds
  people whose recorded flip or rental sits by the deal. Nobody signed up.
  Expect a few who wholesale on the side.
- "How is this different from a cash buyers list?" A county cash list
  carries owner-occupants who paid cash, and misses the flippers who use
  hard money, which is most of them. InvestorBase adds deal history and
  phones, and keeps the financed flippers.
- "How do you know a sale was a flip?" It was bought and resold within a set
  window at a set margin, almost always under an entity. Cash never decides
  it.
- "How accurate are the numbers?" About 8 first numbers in 10 are right.
  Users who dialed all three numbers for every buyer hit mostly wrong ones.
  The first number is the one to call.
- "Can I export every buyer in a county?" No. A search needs an address.
  Walk the radius instead: stretch to 10 miles and 5 years, rerun
  flipper-only then landlord-only, and move the center to new addresses at
  the edge.
- "Will my imported buyers duplicate?" A new search cross-checks the list by
  name, entity, email and phone, and marks a match "In buyer's list". A
  changed phone may slip through.
- "Does skip tracing cost extra?" No.

## Say plainly when asked

These are not confirmed. The exact inputs SmartMatch ranks on. The window and
margin that mark a sale as a flip. Whether Buyers List buyers count toward
the 100.
