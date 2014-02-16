class LibraryWorker
	include Sidekiq::Worker

	def perform(lib_hash)
		if Library.find_by_url(lib_hash[:url]).nil?
      url = lib_hash[:url]+"/adventures.json"
      response = Typhoeus.get(url)
      result = JSON.parse(response.body)
      library = Library.create(name: result["name"], url: result["url"])
      
      create_adventures_with_pages(library, result['adventures'])
    end

    check_other_libraries(lib_hash)

  end

  def check_other_libraries(library)
    url = library[:url] + "/libraries.json"
    response = Typhoeus.get(url)
    result = JSON.parse(response.body)

    result["libraries"].each do |lib|
      if Library.find_by_url(lib["url"]).nil?
        LibraryWorker.perform_async({name: lib["name"], url: lib["url"] })
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

end