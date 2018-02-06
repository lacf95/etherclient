# ethermine_client
Ethermine API Client in Ruby
[API](https://api.ethermine.org/docs/#api-Worker-miner_allWorkerStats)
## Instalation
Clone or download this repository (for now there's no RubyGems gem)
```
gem build ./etherclient.gemspec
gem install ./etherclient-0.0.1.gem
```
## How to use
```ruby
require 'etherclient'
```
First param is the miner and second the worker.
None of them are required but if you try to get any miner or worker related information an exception will rise.
```ruby
# Example data
client = EtherClient.new('d7049af37A18BEDC9A85FE7b378f6085F17050C6', '016')
# Getting the pool hashrate
pool_hashrate = client.pool.hashrate
```
### Instance variables
* .miner_id
* .worker_id
### EtherClient.miner
* .blocks
* .history
* .payouts
* .rounds
* .settings
* .statistics
### EtherClient.pool
* .statistics
* .credits
* .mined_blocks
* .network
* .hashrate
### EtherClient.worker
* .all_statistics
* .historical_statistics
* .statistics
* .monitor
