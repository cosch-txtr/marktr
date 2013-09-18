# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

App.create( { :name=>"txtr", :android_id=>"com.txtr.android", :itunes_id=>"564715781" })
App.create( { :name=>"kobo", :android_id=>"com.kobobooks.android", :itunes_id=>"301259483" } )
App.create( { :name=>"nook", :android_id=>"bn.ereader", :itunes_id=>"373582546" } )                                                                               
App.create( { :name=>"kindle", :android_id=>"com.amazon.kindle", :itunes_id=>"302584613" } )                                                                                 
App.create( { :name=>"playbooks", :android_id=>"com.google.android.apps.books", :itunes_id=>"400989007" } )                                                                  
App.create( { :name=>"libri", :android_id=>"de.ebook.reader", :itunes_id=>"557173140" } )
App.create( { :name=>"pageplace", :android_id=>"de.telekom.epub", :itunes_id=>"415877578" } )
App.create( { :name=>"thalia", :android_id=>"com.freiheit.thalia.mobile", :itunes_id=>"350742971" } )
App.create( { :name=>"weltbild", :android_id=>"de.weltbild.android.ebookreader", :itunes_id=>"435921458" } )
App.create({ :name=>"iBooks", :itunes_id=>"364709193" })

