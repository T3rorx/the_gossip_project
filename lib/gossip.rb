require 'csv'

class Gossip
  attr_accessor :author, :content

  @@all_gossips = []

  def initialize(author, content)
    @author = author
    @content = content
  end
  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [@author, @content]
    end
  end
  def self.all
    all_gossips = []
    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    return all_gossips
  end
  def self.find(id)
    idx = id - 1
    all_gossips = []
    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    gossipx = all_gossips[idx] #retourner le gossip
    return gossipx
  end
  def self.update(id, author_update, content_update)
    gossip_update = @@all_gossips[id]
    gossip_update.author = author_update
    gossip_update.content = content_update
    CSV.open("./db/gossip.csv", "wb") do |csv| 
      @@all_gossips.each do |gossip|     # Écrire chaque potin
        csv << [gossip.author, gossip.content, gossip.comments.join("|")]
      end
    end
  end
end