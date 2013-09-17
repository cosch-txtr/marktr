# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

App.create( { :name=>"txtr", :android_id=>"com.txtr.android"})
App.create( { :name=>"kobo", :android_id=>"com.kobobooks.android" } )
App.create( { :name=>"nook", :android_id=>"bn.ereader" } )                                                                               
App.create( { :name=>"kindle", :android_id=>"com.amazon.kindle" } )                                                                                 
App.create( { :name=>"playbooks", :android_id=>"com.google.android.apps.books" } )                                                                  
App.create( { :name=>"libri", :android_id=>"de.ebook.reader" } )
App.create( { :name=>"pageplace", :android_id=>"de.telekom.epub" } )
App.create( { :name=>"thalia", :android_id=>"com.freiheit.thalia.mobile" } )
App.create( { :name=>"weltbild", :android_id=>"de.weltbild.android.ebookreader" } )
