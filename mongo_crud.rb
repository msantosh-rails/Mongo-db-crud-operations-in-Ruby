require 'mongo'

class MongoDb
include Mongo
	
	@@client=""
	@@db=""
	@@coll=""
	
	def connection

#		@@client = MongoClient.new # (optional host/port args)
#		@@client = MongoClient.new("localhost")
		@@client = MongoClient.new('localhost', 27017)
		@@db     = @@client['test']
		@@coll   = @@db['student']
	end
	
	def insert
		
		@@coll.insert({name:"Reddy",marks:87,place:"SML" })								
	end
	
	def delete
		@@coll.remove({name:"Reddy",marks:87})
	end

	def update

		@@coll.update({"_id" => 44}, {"$set" => {"name" => "S.N.Reddy"}})

	end

	def select

		puts "There are #{@@coll.count} records. they are:"
		@@coll.find.each { |doc| puts doc.inspect }
	end
	
end# MongoDB Class

md=MongoDb.new
md.connection
md.insert
md.select
md.delete
md.update
md.select




