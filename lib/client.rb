class Client
  attr_reader(:client_name, :list_id)

  define_method(:initialize) do |attributes|
    @client_name = attributes.fetch(:client_name)
    @list_id = attributes.fetch(:list_id)
  end

  define_singleton_method(:all) do
    returned_clients = DB.exec("SELECT * FROM clients;")
    clients = []
    returned_clients.each() do |client|
      client_name = client.fetch("client_name")
      list_id = client.fetch("list_id").to_i()
      clients.push(Client.new({:client_name => client_name, :list_id => list_id}))
    end
    clients
  end

  define_method(:save) do
    DB.exec("INSERT INTO clients (client_name, list_id) VALUES ('#{@client_name}', #{@list_id});")
  end

  define_method(:==) do |another_client|
    self.client_name().==(another_client.client_name()).&(self.list_id().==(another_client.list_id()))
  end
end
