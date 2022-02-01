#----------- Topic Create

print "Creating Topics..."

Topic.destroy_all

top1 = Topic.create! area: 'Family Law', description: 'This area deals with Family Law'

top2 = Topic.create! area: 'IP Law', description: 'This area deals with Intellectual Property and Copyrighting'

top3 = Topic.create! area: 'Contract Law', description: 'This area deals with Contractual Obligations'

puts "created #{Topic.count} topics"

#------------ Template Create

print "Creating Templates..."

Document.destroy_all

docu1 = Document.create! title: 'AVO', description: 'This Document is for Apprehended Violence Orders'

docu2 = Document.create! title: 'Divorce', description: 'This Document is for Divorce Matters'

docu3 = Document.create! title: 'IP Registration', description: 'This Document is to register your IP with IP Australia'

docu4 = Document.create! title: 'Patent Registration', description: 'This Document is for Patents'

docu5 = Document.create! title: 'Leases', description: 'This Document is for Leases'

docu6 = Document.create! title: 'Employment', description: 'This Document is for Employment Contracts'

puts "created #{Document.count} topics"

#------------ Associations

top1.documents << docu1 << docu2
top2.documents << docu3 << docu4
top3.documents << docu5 << docu6

puts "Testing topic -< documents association:"
puts "  • the documents '#{Document.first.title}' is on the topic '#{ Document.first.topic.area}' "
puts "  • the topic '#{ Topic.last.area}' has the document: #{ Topic.last.documents.pluck(:title).join(', ') }  "

#-------------User

print "Creating Users..."

User.destroy_all

u1 = User.create! name: 'Stanley Chin', email: 's@hotmail.com', role: 'lawyer'
u2 = User.create! name: 'Liesel Pirece', email: 'l@hotmail.com', role: 'lawyer'
u3 = User.create! name: 'Amy Chin', email: 'a@hotmail.com', role: 'client'
u4 = User.create! name: 'Robert Chin', email: 'r@hotmail.com', role: 'client'
u5 = User.create! name: 'Deborah Chin', email: 'd@hotmail.com', role: 'client'

puts "created #{User.count} users"

