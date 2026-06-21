# 📘 Question 1 — Smart Secure Bank Vault

Create a smart contract called SmartVault where users can:
- Deposit ETH  
- Withdraw ETH  
- Check their balance  


🔹 Requirements
- Store user balances using mapping + struct
- Add a deposit() function (payable)
- Add a withdraw() function:
  
      User can withdraw only their balance
  
      Prevent reentrancy
- Add an owner-only emergencyWithdraw()
- Emit events for deposit and withdrawal

🔐 Additional Rules

✅ Only owner can access emergency function  
✅ Use proper require checks  
✅ Ensure safe ETH transfer  

✅ Goal : 
Build a simple and secure ETH vault for users

# 📘 Question 2 — Decentralized Voting System

Create a smart contract called VotingSystem where users can:
- View proposals  
- Vote for a proposal (only once)  
- Check vote counts  

🔹 Requirements
- Use a struct to store proposal details (name + votes)
- Store proposals using an array
- Track voter participation using a mapping

🔹 Functionalities
- createProposal(): Only owner can create proposals
- vote(): User can vote only once
- Vote increases proposal count
- getVotes(): Return votes for a proposal
- getProposalCount(): Return total proposals

🔐 Additional Rules

✅ One address = one vote  
✅ Only owner can create proposals  
✅ Use require checks for validation  

✅ Goal: 
Build a simple decentralized voting system with fair voting logic

# 📘 Question 3 — Decentralized Auction System

Create a smart contract called AuctionHouse where users can:
- Place bids using ETH  
- Get refunded if outbid  
- Withdraw their pending returns  
- End auction (owner only)  

🔹 Requirements
- Track highest bidder and highest bid
- Use a mapping to store refunds for outbid users
- Maintain auction state (active / ended)

🔹 Functionalities
- placeBid(): Accept ETH bids, Only allow higher bids, Refund previous highest bidder (via mapping)
- withdraw(): Users can withdraw their pending refunds
- endAuction(): Only owner can end auction, Transfer highest bid to owner

🔐 Additional Rules

✅ Only higher bids allowed  
✅ Auction must be active to place bids  
✅ Safe ETH transfer using .call  
✅ Only owner can end auction  

✅ Goal: 
Build a decentralized auction system with fair bidding and secure fund handling

# 📘 Question 4 — Decentralized Crowdfunding Platform

Create a smart contract called CrowdFund where users can:
- Contribute ETH to a campaign  
- Get refunds if goal is not met  
- Allow owner to withdraw funds if goal is reached  
- Track campaign status  

🔹 Requirements
- Set a funding goal during deployment
- Track contributions using a mapping
- Maintain campaign state (active / ended)

🔹 Functionalities
- contribute(): Users can send ETH to support campaign, Store contribution in mapping
- withdraw(): Only owner can withdraw, Allowed only if campaign ended AND goal is reached
- getRefund(): Users can claim refund, Allowed only if campaign ended AND goal is NOT reached
- endCampaign(): Only owner can manually end campaign

🔐 Additional Rules

✅ Campaign must be active for contributions  
✅ Only owner can withdraw funds  
✅ Refund only if goal not achieved  
✅ Safe ETH transfer using .call  

✅ Goal: 
Build a decentralized crowdfunding system with fair fund handling and refund mechanism

# 📘 Question 5 — Subscription Payment Manager

Create a smart contract called SubscriptionManager where users can:
- Subscribe by paying ETH  
- Cancel subscription and get partial refund  
- Check subscription status  
- Owner can withdraw collected funds  

🔹 Requirements
- Use a struct + mapping to store user subscription data
- Set a fixed subscription price during deployment
- Track whether a user is subscribed

🔹 Functionalities
- subscribe(): User pays exact subscription fee, Activates subscription
- cancelSubscription(): User cancels subscription, Gets partial refund (50%)
- withdrawFunds(): Only owner can withdraw contract balance
- getSubscriptionStatus(): Returns whether user is subscribed

🔐 Additional Rules

✅ User can subscribe only once at a time  
✅ Exact ETH amount required to subscribe  
✅ Safe ETH transfer using .call  
✅ Only owner can withdraw funds  

✅ Goal: 
Build a subscription system with payment tracking and refund mechanism
