Rails.logger.debug '============== IMPORTANDO DADOS ============'

full_path_json = Rails.root.join('db/data/mock.json')

tools = JSON.parse(File.read(full_path_json))

tools.each do |tool|
  tool_database = Tool.create!(
    title: tool['title'],
    description: tool['description'],
    link: tool['link']
  )

  tool['tags'].each do |tag|
    Tag.create!(description: tag, tool_id: tool_database.id)
  end
end
Rails.logger.debug '============== IMPORTANDO DADOS ============'
