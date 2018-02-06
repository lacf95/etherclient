class EtherClient::Api::WorkerApi < EtherClient::Api

  def initialize(miner_id, worker_id = nil)
    @miner_id = miner_id
    @worker_id = worker_id
  end

  def all_statistics
    array = ethermine_request("miner/#{@miner_id}/workers")
    EtherClient::Model::WorkerStatistic.all(array)
  end

  def historical_statistics
    array = ethermine_request("miner/#{@miner_id}/worker/#{@worker_id}/history")
    EtherClient::Model::WorkerHistoricalStatistic.all(array)
  end

  def statistics
    data = ethermine_request("miner/#{@miner_id}/worker/#{@worker_id}/currentStats")
    data['worker'] = @worker_id
    EtherClient::Model::WorkerStatistic.new(data)
  end

  def monitor
    array = ethermine_request("miner/#{@miner_id}/workers/monitor")
    EtherClient::Model::WorkerMonitor.all(array)
  end
end
