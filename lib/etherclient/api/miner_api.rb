class EtherClient::Api::MinerApi < EtherClient::Api

  def initialize(miner_id)
    @miner_id = miner_id
  end

  def blocks
    array = ethpool_request("miner/#{@miner_id}/blocks")
    EtherClient::Model::MinerBlock.all(array)
  end

  def history
    array = ethermine_request("miner/#{@miner_id}/history")
    EtherClient::Model::MinerHistory.all(array)
  end

  def payouts
    array = ethermine_request("miner/#{@miner_id}/payouts")
    EtherClient::Model::MinerPayout.all(array)
  end

  def rounds
    array = ethermine_request("miner/#{@miner_id}/rounds")
    EtherClient::Model::MinerRound.all(array)
  end

  def settings
    data = ethermine_request("miner/#{@miner_id}/settings")
    EtherClient::Model::MinerSetting.new(data)
  end

  def statistics
    data = ethermine_request("miner/#{@miner_id}/currentStats")
    EtherClient::Model::MinerStatistic.new(data)
  end
end
