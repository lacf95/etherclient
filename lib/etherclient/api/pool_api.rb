class EtherClient::Api::PoolApi < EtherClient::Api

  def statistics
    data = ethermine_request("poolStats")
    EtherClient::Model::PoolStatistic.new(data)
  end

  def credits
    array = ethpool_request("credits")
    EtherClient::Model::PoolCredit.all(array)
  end

  def mined_blocks
    array = ethermine_request("blocks/history")
    EtherClient::Model::PoolMinedBlock.all(array)
  end

  def network
    data = ethermine_request("networkStats")
    EtherClient::Model::PoolNetwork.new(data)
  end

  def hashrate
    array = ethermine_request("servers/history")
    EtherClient::Model::PoolHashrate.all(array)
  end
end
