---
name: buyer-outreach
description: Build the call sheet and work the buyers. Use when the user wants a buyer script, asks what to text or say in a voicemail, says a buyer wants the details, says nobody picks up, or asks what to do on each outreach day.
---

# Buyer outreach

Get the buyers in the pool on the phone, and move each one to a walkthrough,
an offer, or a clean no.

Build the call sheet: the call order, an opener per buyer from their nearby
deal, the voicemail and the text. Answer objections. Keep the cadence from the
first outreach day until offers are due. Help live, mid-call.

## Rules

1. Draft every message. Never send one. Sending is the user's own step.
2. Every write to InvestorBase asks the user first.
3. Every urgency line must be true for this deal. Never invent an offer or
   demand. Never share an exact offer. Never tell the top bidder that someone
   is higher.
4. Never write blast copy, not even for an opted-in list. Bulk texting
   needs consent and carrier checks. Coach calls to fitted buyers, one at
   a time.

## Before you spend anything

1. Call `get_usage` first.
2. `get_buyer_history` counts against a monthly limit, one per call:
   `linked_deals` in `get_usage`. The call sheet reads one per buyer. Say
   how many reads that is, then ask.

## With no account

Write the script, the texts and the objection answers from the deal the user
describes. Offer the sign-in to read the deal and the buyer history.

## MCP tools

`list_deals`, `get_deal`, `get_buyer_history`, `get_buyer_inquiries`,
`create_buyers_list_buyer`.

## Hand-off

When the pool is short, load the `find-buyers` skill. In Claude Code, call
the Skill tool with "dispo:find-buyers".

## Playbook

### 1. Prep before the first dial

- Price set, contract signed, landing page live, the branded link on the
  user's phone.
- Know occupancy, close date, title company and access.
- Set the walkthrough date before the first call, and pre-book the slots.
  With the date set, a buyer books on the spot.
- Find the deal with `list_deals`, then build the call sheet with `get_deal`: the buyers in SmartMatch order, with
  status and numbers. The sniper list goes first: the closest and most recent
  buyers.
- Before each dial, open the buyer's deal nearest the subject with
  `get_buyer_history`. Memorize five or six of their addresses near the deal
  while the phone rings.

### 2. The cadence

- Campaign Day 1: every buyer gets a double call, a voicemail and a text.
- The double call, exactly: call. On no answer, call again at once, with no
  voicemail on the first. Leave the voicemail on the second. Then text.
  Carriers flag a first call from an unknown number as possible spam, and
  many buyers pick up only on the second ring.
- A double call, voicemail and text reaches about 35 buyers in 100. A single
  dial reaches 10 to 15.
- Campaign Day 3: repeat the double call, voicemail and text for everyone
  still at no answer. Add days until the response rate reaches 35%. Most
  responses come on the second or third attempt. The second pass adds 10 to
  15 points.
- Days 3 to 6: call everyone who clicked, replied or showed light interest.
  Confirm area and price band. A quick no beats a long maybe.
- No answer is not no interest. They are busy. Reach every buyer on the list
  two or three times. It is about 100 people, not thousands.
- A great-fit buyer, or one with hundreds of deals, gets 3 or 4 tries and
  the backup numbers. A must-have buyer who ignores calls gets the text, a
  message on social media and a handwritten letter.
- Dial the first number on the card. Spend almost all dial time there. Call
  backup numbers only on Day 2 or 3, when buyers are still short. Dialing all
  three for every buyer wastes the day.
- Wrong number: ask whether they invest or did the flip at that address. If
  not, mark the number and move on.
- Get a local number in the area code most common on the list, and leave it
  on voicemails. Weight the buyers whose first number shares that area code.
  They are local, and their numbers are more often right.
- Dial fast down the list, but do not power dial. Each call should feel
  special.

### 3. Channels

- Cold calling is the highest-converting channel and non-negotiable. Every
  other channel exists to drive a phone call. Deals almost never sell by text
  unless the buyer knows the user.
- Text is second. Email still goes to the opted-in list, but skip-traced
  emails bounce about half the time, and a buyer gets about 6 deal emails a
  day.
- When the user still blasts, coach the call to the perfect-fit buyer anyway,
  and get every responder on the phone.

### 4. The opener

- Reference their deal and this deal in the first 15 seconds. Act like you
  know them: "Hey [name], this is [you]." Never "is this [name]?", never
  "still buying?". Assume whoever answers is the buyer, and still buys.
- Name the neighborhood, not the city, and cite two of their recent deals by
  street. Two price anchors beat one.
- Say they are one of the first to see it, and say why you called them: you
  know they are qualified and you want to sell fast. No buyer wants to be the
  500th call. Never let them think it is on the MLS or stale on a
  marketplace.
- Give price and details fast. Buyers ask them in the first seconds. Match
  their pace: specs, rehab level, ARV, no small talk.
- Speak in the buyer's lens. Flipper: what you would change. Landlord: rent,
  cash on cash, gross yield, the 1% rule, cap rate. Developer: the lot.
  Unsure? Ask.
- Know why the deal makes this investor money, and say it on the first call.
- Credibility: deals closed, deals a month in their area, and that the user
  wants a relationship. Naming a well-known local title company shows the
  user knows the area.
- Dangle the pipeline only when true: the user markets heavily here, more
  deals are coming, and buyers who get close to asking get the first shot.
- Blunt, direct, high energy, the confidence of the person holding the deal.
  Say "deals", never "properties". The first 20 seconds decide a hang-up or
  a top offer.

The shape of the call:

1. The flip they did on [street]. How did it go?
2. One around the corner. Specs, rehab level, asking, ARV.
3. Priced under what they paid there. Offer to text the comps.
4. The walkthrough day. Offers go through the page.

### 5. The text and the voicemail

- The text is a shorter opener. It still names their deal by address: the
  flip or rental they did at [address], a property around the corner, and a
  call to action. The personal version gets 20 to 30 replies in 100.
- No link in the first text. When they reply with interest, call and share
  the link live. A link alone gets silence, and brings about 5 times more
  STOP replies.
- Write as if they are one of very few. A spec list reads like a blast to
  hundreds. Avoid "here's the deal info, let me know".
- A reply asking for details gets beds, baths, street and asking price, then
  a request for a quick call, where the user sends the link.
- One text per buyer, drafted from that buyer's deal. It takes the same time
  as a generic one. The user sends each by hand and checks every paste.
- Voicemail: upbeat, short, one clear reason to call back.

Text draft:

> Hey [name], [you] here. Saw the flip you did on [street]. I have one around
> the corner in [neighborhood], same plan. Got a minute today?

Voicemail draft:

> [Name], it's [you]. I called about a deal around the corner from your flip
> on [street]. I want you to see it before anyone else. Call me at [number].

### 6. Send the landing page live

- Send the landing page while on the phone, and keep them on the line while
  they look. Review the details and the photos together.
- Confirm the photos came through. Say offers go through the page. Give the
  walkthrough day.
- Even when they ask for email, text the link right away and ask: walk it
  first, or buy sight unseen?
- A link opened on the call feels like a one-off opportunity, not a blast.

### 7. Qualify and close the call

- A call drives four things: interest, urgency, a capability check, and a
  call to action.
- After interest, in order: qualify, book the walkthrough, try for a
  tentative offer, share the highest and best date, collect email and best
  contact.
- Must-ask: cash or debt, how fast to close, how fast to walk it, how many
  inspections, is EMD a problem on an assignment.
- Sight-unseen buyer: active in the area and price band, offer tied to a
  rehab number, closes on the user's timeline, EMD fine, cash or hard money,
  fine with the user's title company. The test: if rehab goes up 10,000,
  does the offer drop 10,000? The right answer is yes, not 20,000.
- Price anchor: "yours has the same specs as the one you bought on [street].
  Would you be around what you paid there?" Worst case they correct you to
  their real number.
- End the first call with a walkthrough booked, an offer, or both. Always
  name the next step: a showing time, a confirm call that day, then contract
  plus EMD invoice with a deadline.
- About half the buyers reached are interested. The target is 60%. The usual
  pitfall is reaching buyers, not interest.
- After the call, offer to save the buy box with `create_buyers_list_buyer`.
  Ask first.

### 8. Objections

- "Send me the details": "Just texted you the link. Did the photos come
  through?" Review on the phone. Serious buyers open it 9 times in 10. The
  link test ends three days of chasing a ghost. Then go for no: is this a
  polite no, or just busy?
- "Not buying right now": 9 times in 10 it is timing. Name their deals on
  nearby streets and ask what changed. Add that the price is aggressive
  against what they usually pay. Then ask about their ideal house and when
  they buy again, and save the buy box.
- "How did you get my number?": software tied to public records that finds
  flippers and landlords, based on their deal.
- "Lost money there" or "not buying in that area": there is room to make
  money on this one. Ask what areas they buy.
- "Not interested in this one": find out why (price, location, other) and
  ask for a price range.
- "I hate bidding wars": "You are among my first calls, and I do not want to
  blast this." Back it with credibility. Promise no exclusivity you will not
  keep.
- "I can look in two weeks": create true urgency, then remove friction: a
  flexible time, send someone, a detailed photo link, a short inspection
  report, or EMD now and walk later.
- Busy on a jobsite: do not push. Ask when to expect an answer, and follow
  up then.
- "I'm not a buyer, take me off": the user reports it to support. It is
  usually a wrong skip trace or the wrong LLC owner.

### 9. Walkthroughs and reminders

- Book on the first call, confirm the time, send a calendar invite at once.
- Remind 24 hours before and the morning of, and call if needed. A missed
  walkthrough is a reminder failure.
- Before the walkthrough, text again, call the top buyers again, give clear
  instructions, and track who said yes against who came.
- Call an hour after the walkthrough: how did it go, when offers are due,
  where will they land.
- Call the visitors who viewed the page without offering. Read them with
  `get_buyer_inquiries`.

### 10. Before contract

- Calling buyers before the contract is signed: never claim it is under
  contract. Say it is in the pipeline. One goal, to flush a price. Call first
  the buyers who paid the most for a like-kind house.

## Answers to common questions

- "Should I text the landing page to my list?" Not in the first text to a
  new buyer. Send it while they are on the phone.
- "Which messages work?" The ones that make each buyer feel handpicked:
  their name, the user's neighborhood, the flip they did next door.
- "Why does only one number show?" Only one is usually right. The rest are
  backups, turned on in settings.
- "Should I blast first and then call?" A blast gets a few hand raises, and
  each one still needs a call. The double call reaches 35 buyers in 100.
- "Will 50 to 70 buyers give 2 or 3 offers?" Yes, with salesmanship, and a
  few extra tries at the great fits.
- "I called my top buyer once a day for two days and texted once." That
  skipped the double call, the most common gap.

## Not in this skill

Sending. In-app texting is not live. The user texts through their dialer, a
CRM app or an automation. Calendar invites and reminders live outside
InvestorBase.
