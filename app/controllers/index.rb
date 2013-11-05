#############################################
#####VIEWING ALL NOTES########################

get '/' do
  @notes = Note.all
  erb :index
end

#################################################
########ADDING A NOTE############################
get '/create' do
	erb :create
end

post '/create' do 
	n = Note.create					#could i use Note.new?? or only with Datamapper?
	n.name = params[:name]
	n.body = params[:body]
	n.save
	redirect '/create'
end

####################################################
########VIEW A SINGLE NOTE#########################
get '/notes/:id' do 
	@note = Note.find(params[:id]) 	#do i need to use Note.find?
	erb :edit
end
####################################################
##############EDITING A NOTE #######################
put '/notes/:id' do 
	Note.update(params[:id], :body => params[:body]) #use Note.update??
	# n.name = params[:name]
	# n.body = params[:body]
	# n.updated_at = Time.now
	# n.save
	redirect '/'
end

####################################################
############DELETING A NOTE ########################

get '/delete/:id' do
	@note = Note.find params[:id]
	erb :delete
end

delete '/delete/:id' do 
	n = Note.find params[:id]
	n.destroy
	redirect '/'
end
















