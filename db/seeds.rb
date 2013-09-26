# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

App.create( { :name=>"txtr", :android_id=>"com.txtr.android", 
			  :itunes_id=>"564715781", :itunes_country=>"de", 
			  :win8_id=>"txtr-reader/1e3b5a45-302f-4e99-a4d3-9a2371c2a395", :win8_country=>"de-de" }) if !App.find_by_name "txtr"

App.create( { :name=>"kobo", :android_id=>"com.kobobooks.android", 
			  :itunes_id=>"301259483", :itunes_country=>"us",
			  :win8_id=>"kobo/05e8583d-b242-43be-8dcf-c8a9c49d8ee3", :win8_country=>"en-us" } ) if !App.find_by_name "kobo"

App.create( { :name=>"nook", :android_id=>"bn.ereader", 
			  :itunes_id=>"373582546", :itunes_country=>"us" ,
			  :win8_id=>"nook-books-magazines-newspapers/05dbbb07-cd42-4a5f-9cd3-a329d52bd372", :win8_country=>"en-us" } ) if !App.find_by_name "nook"

App.create( { :name=>"kindle", :android_id=>"com.amazon.kindle", 
			  :itunes_id=>"302584613", :itunes_country=>"us",    
			  :win8_id=>"kindle/1d7e4396-0143-4aed-8892-84eb75e799f3", :win8_country=>"en-us" } ) if !App.find_by_name "kindle"

App.create( { :name=>"playbooks", :android_id=>"com.google.android.apps.books", 
			  :itunes_id=>"400989007", :itunes_country=>"us" } ) if !App.find_by_name "playbooks"

App.create( { :name=>"libri", :android_id=>"de.ebook.reader", 
			  :itunes_id=>"557173140", :itunes_country=>"de" } ) if !App.find_by_name "libri"

App.create( { :name=>"pageplace", :android_id=>"de.telekom.epub", 
	  		  :itunes_id=>"415877578", :itunes_country=>"de" } ) if !App.find_by_name "pageplace"

App.create( { :name=>"thalia", :android_id=>"com.freiheit.thalia.mobile", 
			  :itunes_id=>"350742971", :itunes_country=>"de" } ) if !App.find_by_name "thalia"

App.create( { :name=>"weltbild", :android_id=>"de.weltbild.android.ebookreader", 
			  :itunes_id=>"435921458", :itunes_country=>"de" } ) if !App.find_by_name "weltbild"

App.create( { :name=>"ciando", :android_id=>"com.ciando.ciandoreader", 
	 		  :itunes_id=>"518274502", :itunes_country=>"de" }) if !App.find_by_name "ciando"

App.create( { :name=>"3M Cloud Library", :android_id=>"com.txtr.android.mmm", 
	 		  :itunes_id=>"466446054", :itunes_country=>"us" }) if !App.find_by_name "3M Cloud Library"

App.create( { :name=>"Foyles", :android_id=>"com.txtr.android.foyles", 
	 		  :itunes_id=>"498928265", :itunes_country=>"us" }) if !App.find_by_name "Foyles"

App.create( { :name=>"Planet9", :android_id=>"com.txtr.android.tcom"#, 
	 		  #:itunes_id=>"447344289", :itunes_country=>"us" }
	 		  ) if !App.find_by_name "Planet9"

App.create( { :name=>"iBooks", :itunes_id=>"364709193", :itunes_country=>"us" } ) if !App.find_by_name "iBooks"


a=App.find_by_name "txtr"
a.win8_id="txtr-reader/1e3b5a45-302f-4e99-a4d3-9a2371c2a395" if !a.win8_id
a.win8_country="de-de" if !a.win8_country
a.save!

a=App.find_by_name "kobo"
a.win8_id="kobo/05e8583d-b242-43be-8dcf-c8a9c49d8ee3" if !a.win8_id
a.win8_country="en-us" if !a.win8_country
a.save!

a=App.find_by_name "nook"
a.win8_id="nook-books-magazines-newspapers/05dbbb07-cd42-4a5f-9cd3-a329d52bd372" if !a.win8_id
a.win8_country="en-us" if !a.win8_country
a.save!

a=App.find_by_name "kindle"
a.win8_id="kindle/1d7e4396-0143-4aed-8892-84eb75e799f3" if !a.win8_id
a.win8_country="en-us" if !a.win8_country
a.save!