require 'rubygems'
require 'minitest/autorun'


$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__)))
require 'ruby-gallery3'

class TestGallery3 < Minitest::Test
    def setup
      @gallery3 = Gallery3.new
    end
    
    def test_login
      puts @gallery3.login?
    end    
        
    def test_find_item
      puts @gallery3.find_item :id => 2
    end
    
    
    def test_create_item
      # puts @gallery3.create_item :entity => {:name => "aaaa", :title => "aaa", :type => "album"}, :target_item =>{:id=> 2}
      puts @gallery3.create_item :entity => {:name => "aaaa", :title => "aaa", :type => "album"}
    end
        
    def test_upload_file
      puts @gallery3.upload_file :file => '/Users/saltfactory/Downloads/bh6hug.jpg'
                                  # :entity => {:title => "test", :name => "bh6hug,jpg", :type => "photo"}, 
                                  # :target_item => {:id => 2}      
    end
    
    def test_image_url_public?
      puts @gallery3.image_url_public?(:id => 106)
    end
    
   
  end