class EtherClient
  attr_reader :miner_id, :worker_id, :worker, :pool, :miner

  def initialize(miner_id = nil, worker_id = nil)
    @miner_id = miner_id
    @worker_id = worker_id
    set_apis
  end

  def miner_id=(miner_id)
    @miner_id = miner_id
    set_apis
  end

  def worker_id=(worker_id)
    @worker_id = worker_id
    set_apis
  end

  private
    def set_apis
      set_miner
      set_pool
      set_worker
    end

    def set_miner
      @miner = Api::MinerApi.new(@miner_id)
    end

    def set_pool
      @pool = Api::PoolApi.new
    end

    def set_worker
      @worker = Api::WorkerApi.new(@miner_id, @worker_id)
    end
end

require_relative 'etherclient/client'
require_relative 'etherclient/attrs'
require_relative 'etherclient/api/base_api'
require_relative 'etherclient/api/miner_api'
require_relative 'etherclient/api/pool_api'
require_relative 'etherclient/api/worker_api'
require_relative 'etherclient/models/model'
require_relative 'etherclient/models/miner/block'
require_relative 'etherclient/models/miner/history'
require_relative 'etherclient/models/miner/payout'
require_relative 'etherclient/models/miner/round'
require_relative 'etherclient/models/miner/setting'
require_relative 'etherclient/models/miner/statistic'
require_relative 'etherclient/models/pool/statistic'
require_relative 'etherclient/models/pool/credit'
require_relative 'etherclient/models/pool/mined_block'
require_relative 'etherclient/models/pool/network'
require_relative 'etherclient/models/pool/hashrate'
require_relative 'etherclient/models/worker/statistic'
require_relative 'etherclient/models/worker/historical_statistic'
require_relative 'etherclient/models/worker/monitor'
