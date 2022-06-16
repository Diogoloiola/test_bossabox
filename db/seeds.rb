Rails.logger.debug '============== IMPORTANDO DADOS ============'

full_path_json = Rails.root.join('db/data/mock.json')

locations = JSON.parse(File.read(full_path_json))

locations.each do |location|
  location_database = Location.create!(
    title: location['title'],
    description: location['description'],
    link: location['link']
  )

  location['tags'].each do |tag|
    Tag.create!(description: tag, location_id: location_database.id)
  end
end
Rails.logger.debug '============== IMPORTANDO DADOS ============'
