class LibraryWorker
  include Sidekiq::Worker

  def perform(library_hash)

    url = correct_url(library_hash["url"])

    if Library.find_by_url(url).nil?
      json_url = url +"adventures.json"
      response = Typhoeus.get(json_url)
      result = JSON.parse(response.body)
      library = Library.create(name: library_hash["name"], url: url )
      
      create_adventures_with_pages(library, result['adventures'])
    end

    check_other_libraries(url)

  end

  def check_other_libraries(library_url)
    json_url = library_url + "libraries.json"
    response = Typhoeus.get(json_url)
    result = JSON.parse(response.body)

    result["libraries"].each do |lib|
      if Library.find_by_url(lib["url"]).nil?
        LibraryWorker.perform_async({"name" => lib["name"], "url" => lib["url"] })
      end
    end
  end

  def create_adventures_with_pages(library, adventures)
    adventures.each do |adv|
      adventure = library.adventures.create(title: adv["title"], author: adv["author"], guid: adv["guid"] )
      adv["pages"].each do |page|
        adventure.pages.create(name: page["name"], text: page["text"] )
      end
    end
  end

  def correct_url(url)
    if url.include? ".com"
      return url.split(".com").first + ".com/"
    else
      raise StandardError
    end
  end

end