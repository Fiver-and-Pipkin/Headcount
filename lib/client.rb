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
end
