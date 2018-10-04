require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( './models/student.rb' )
require_relative( './models/house.rb' )
## can do a * to require an entire folder but priveleges dictate what you may want to grant access to
also_reload( './models/*' )

## if its going to be in a view give it an instance variable, otherwise just keep it tight
# #RESTful routing Students

  ## INDEX ROUTE
  get('/students') do
    @students = Student.all()
    erb(:index)
  end

  ## NEW ROUTE ##
  get('/students/new') do
    erb(:new)
  end

  ## SHOW ##   ## specific student ##
  get('/students/:id') do
    id = params[:id].to_i #everything in params is a string so needs an   integer
    @student = Student.find(id)
    erb(:show)
  end

  ## CREATE ##
  post('/students') do
    @student = Student.new(params)
    @student.save
    erb(:create)
  end

 ## DELETE ##
 post('/students/:id/delete') do
  id = params[:id].to_i
  @student = Student.find(id)
  @student.delete
  # erb(:delete)
  redirect('/students')
 end

  ## EDIT ##
  get('/students/:id/edit') do
    @id = params[:id].to_i
    @student = Student.find(@id)
    erb(:edit)
  end

  ## UPDATE ##
  post('/students/:id') do
    # id = params[:id].to_i
    # @student = Student.find(id)
    # @student.update
    Student.new(params).update
    ## What we're doing is populating the old object with this new objects data, the new object is the update being popped into place of the old one, only the id persists
    redirect('/students')
  end

  #####################################################
  ######################################################
  ######################################################

# #RESTful routing houses

  ## INDEX ROUTE
  get('/houses') do
    @house = House.all()
    erb(:house_index)
  end

  # ## NEW ROUTE ##
  # get('/houses/new') do
  #   erb(:house_new)
  # end

  ## SHOW ##   ## specific student ##
  get('/houses/:id') do
    id = params[:id].to_i #everything in params is a string so needs an   integer
    @house = House.find(id)
    erb(:house_show)
  end

 #  ## CREATE ##
 #  post('/houses') do
 #    @house = House.new(params)
 #    @house.save
 #    erb(:house_create)
 #  end
 #
 # ## DELETE ##
 # post('/houses/:id/delete') do
 #  id = params[:id].to_i
 #  @house = House.find(id)
 #  @house.delete
 #  # erb(:delete)
 #  redirect('/students')
 # end
 #
 #  ## EDIT ##
 #  get('/houses/:id/edit') do
 #    @id = params[:id].to_i
 #    @house = House.find(@id)
 #    erb(:edit)
 #  end
 #
 #  ## UPDATE ##
 #  post('/houses/:id') do
 #    # id = params[:id].to_i
 #    # @student = House.find(id)
 #    # @student.update
 #    House.new(params).update
 #    ## What we're doing is populating the old object with this new objects data, the new object is the update being popped into place of the old one, only the id persists
 #    redirect('/students')
 #  end
