require 'json'
require 'pathname'
require 'rest_client'



class Gallery3
    
  def initialize(options = nil)
    if options != nil
      @options = options      
    elsif
      file = File.read(Pathname.new(ENV["HOME"]).join(".gallery3.json"))
      @options = JSON.parse(file, :symbolize_names => true)
    end
  end
    
  def login? (user_info = nil)
    url = "#{@options[:host]}#{@options[:base]}/rest"
    # response = RestClient.post(url, 
    #       {'user' => userInfo[:user], 'password' => userInfo[:password]},
    #       {"Content-Type" => "application/x-www-form-urlencoded", "X-Gallery-Request-Method" => "post"} )
    user_info = {
      :user => @options[:user],
      :password => @options[:password]
    }
    
    response = RestClient::Request.execute(
      :method => :post, 
      :url => url, 
      :headers => {"Content-Type" => "application/x-www-form-urlencoded", "X-Gallery-Request-Method" => "post"},
      :payload => user_info)
    return response
  end
  
  def find_item(item)
    # url = "#{@options['host']}#{@options['base']}/rest/item/#{item[:id]}"
    # response = RestClient.get url, :headers => {"X-Gallery-Request-Key" => @options["requestKey"], "X-Gallery-Request-Method" => "get"}
    # item = JSON.parse(response)
    # return item
    url = "#{@options[:host]}#{@options[:base]}/rest/item/#{item[:id]}"
    
    response = RestClient::Request.execute(
      :method => :get, 
      :url => url, 
      :headers => {
        "X-Gallery-Request-Method" => "get", 
        "X-Gallery-Request-Key" => @options[:requestKey]
        })
    return JSON.parse(response, :symbolize_names => true)
    
  end

  def create_item(item_info)
    entity = JSON.generate(item_info[:entity])

    item_id = @options[:rootItemId]
    item_id = item_info[:target_item][:id] if !item_info[:target_item].nil?
    
    url = "#{@options[:host]}#{@options[:base]}/rest/item/#{item_id}"
    
    response = RestClient::Request.execute(
      :method => :post, 
      :url => url, 
      :headers => {"X-Gallery-Request-Method" => "post"," X-Gallery-Request-Key" => @options[:requestKey]},
      :payload => {'entity' => entity})

    return JSON.parse(response, :symbolize_names => true)
  end
  
  def upload_file(upload_info)
    # entity = JSON.generate(uploadInfo[:entity])
    item_id = @options[:rootItemId]
    item_id = upload_info[:target_item][:id] if !upload_info[:target_item].nil?
          
    entity = {
      :title => File.basename(upload_info[:file], File.extname(upload_info[:file])),
      :name => File.basename(upload_info[:file]).downcase.gsub(" ", "_"),
      :type => 'photo'
    }    

    upload_info_entity = upload_info[:entity]
    
    if !upload_info_entity.nil? then
      entity[:title] = upload_info_entity[:title] if !upload_info_entity[:title].nil?
      entity[:name] = upload_info_entity[:name] if !upload_info_entity[:name].nil?    
    end
        
    url = "#{@options[:host]}#{@options[:base]}/rest/item/#{item_id}"
    
    response = RestClient::Request.execute(
      :method => :post, 
      :url => url, 
      :headers => {"X-Gallery-Request-Method" => "post"," X-Gallery-Request-Key" => @options[:requestKey], 'Content-Type' => 'multipart/form-data'},
      :payload => {
        'entity' => JSON.generate(entity),
        :multipart => true, 
        :file  => File.new(upload_info[:file], 'rb')}
      ) 
          
    return JSON.parse(response, :symbolize_names => true)    
  end
  
  def image_url_public?(item)
    return find_item(item)[:entity][:file_url_public]
  end

end

